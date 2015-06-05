#encoding: utf-8

#Una instancia de esta clase es la encargada de construir el esqueleto del nuevo proyecto.
class ConstructorDeEsqueleto

  attr_reader :inconveniente

  #todo lo que sea 'proyect' debe ser reemplazado por el nombre original del proyecto
  SUBCARPETAS = %w{bin lib lib/proyect doc}
  SUBCARPETAS_RSPEC = %w{spec spec/proyect}
  SUBCARPETAS_CUCUMBER = %w{features features/support features/step_definitions}
  SUBCARPETAS_MINITEST = %w{test}
  SUBCARPETAS_FULL = %w{data share ext}
  ARCHIVOS = %w{Changelog.md Gemfile Gemfile.lock License.md Rakefile ReadMe.md bin/proyect lib/proyect.rb}
  ARCHIVOS_RSPEC = %w{spec/spec_helper.rb}
  ARCHIVOS_CUCUMBER = %w{features/support/env.rb}

  #@param nombre_del_proyecto [String]. @return [TrueClass or FalseClass].
  def construir_esqueleto(nombre_del_proyecto)
    @nombre_del_proyecto = nombre_del_proyecto
    if !(existe_carpeta_de_mismo_nombre_que_este_proyecto_en_el_directorio_actual?)
      crear_carpeta_del_proyecto()
    else
      @inconveniente = "Skeletal structure can't be built. There's an existing folder in the working directory called #{@nombre_del_proyecto}.\n"
      return false
    end
    #me voy a pasar a la carpeta creada
    @directorio_de_trabajo_original = Dir.pwd #: String
    Dir.chdir("./#{@nombre_del_proyecto}")
    #ahí mismo creo el resto de las carpetas
    crear_subcarpetas()
    crear_archivos()
    escribir_archivos()
    #vuelvo al directorio original
    Dir.chdir(@directorio_de_trabajo_original)
    #si todo anduvo bien devuelvo true
    true
  end

  def crear_carpeta_del_proyecto
    #creo la carpeta principal
    Dir.mkdir(@nombre_del_proyecto)
    #le digo a la aplicación que escriba en la salida un progreso
    ::COCOT.salida.escribir('.')
  end

  def crear_subcarpetas
    # creo las comunes
    crear_subcarpetas!(SUBCARPETAS)
    # chequeo las extras
    case ::COCOT.juzgador_de_argumentos.modo
      when '--rspec-only'
        crear_subcarpetas!(SUBCARPETAS_RSPEC)
      when '--cucumber-only'
        crear_subcarpetas!(SUBCARPETAS_CUCUMBER)
      when '--minitest-only'
        crear_subcarpetas!(SUBCARPETAS_MINITEST)
      when nil
        crear_subcarpetas!(SUBCARPETAS_RSPEC)
        crear_subcarpetas!(SUBCARPETAS_CUCUMBER)
      else
    end
    # chequeo si el usuario quiere las carpetas extras
    if ::COCOT.juzgador_de_argumentos.full then crear_subcarpetas!(SUBCARPETAS_FULL) end
  end

  def crear_subcarpetas!(subcarpetas)
    subcarpetas.collect {|carpeta| if carpeta.include?('proyect') then carpeta.sub('proyect', @nombre_del_proyecto) else carpeta end}.each do |carpeta|
      Dir.mkdir(carpeta)
      ::COCOT.salida.escribir('.')
    end
  end

  def crear_archivos
    # creo los archivos principales
    crear_archivos!(ARCHIVOS)
    # dependiendo de las opciones pasadas creo resto de archivos
    case ::COCOT.juzgador_de_argumentos.modo
      when '--rspec-only'
        crear_archivos!(ARCHIVOS_RSPEC)
      when '--cucumber-only'
        crear_archivos!(ARCHIVOS_CUCUMBER)
      when nil
        crear_archivos!(ARCHIVOS_RSPEC)
        crear_archivos!(ARCHIVOS_CUCUMBER)
    end
    # fin de creación de archivos
    ::COCOT.salida.escribir("\n")
  end

  def crear_archivos!(archivos)
    archivos.collect {|archivo| if archivo.include?('proyect') then archivo.sub('proyect', @nombre_del_proyecto) else archivo end}.each do |archivo|
      File.new(archivo, 'w+').close
      ::COCOT.salida.escribir('.')
    end
  end

  def escribir_archivos
    obtener_contenido_de_archivos() #: Hash
    @contenido_de_archivos.each_pair do |nombre_del_archivo, contenido|
      _nombre_del_archivo = nombre_del_archivo.to_s.sub('proyect', @nombre_del_proyecto)
      # chequeo si el archivo existe
      if(File.exist?(_nombre_del_archivo))
        # existe, lo escribo
        File.open(_nombre_del_archivo, 'w+') do |archivo|
          archivo.write(contenido.gsub('name_of_the_proyect', @nombre_del_proyecto))
        end
      end
    end
    # re-escribo el Rakefile
    File.open('Rakefile', 'w') do |archivo|
      case ::COCOT.juzgador_de_argumentos.modo
        when '--rspec-only'
          archivo.write(@contenido_de_archivos[:rakefile_rspec_only])
        when '--cucumber-only'
          archivo.write(@contenido_de_archivos[:rakefile_cucumber_only])
        when '--minitest-only'
          archivo.write(@contenido_de_archivos[:rakefile_minitest_only])
        when '--clean'
          archivo.write(@contenido_de_archivos[:rakefile_clean])
        else
          archivo.write(@contenido_de_archivos[:rakefile])
      end
    end
    # re-escribo el Gemfile
    File.open('Gemfile', 'w') do |archivo|
      case ::COCOT.juzgador_de_argumentos.modo
        when '--rspec-only'
          archivo.write(@contenido_de_archivos[:gemfile_rspec_only])
        when '--cucumber-only'
          archivo.write(@contenido_de_archivos[:gemfile_cucumber_only])
        when '--minitest-only'
          archivo.write(@contenido_de_archivos[:gemfile_clean])
        when '--clean'
          archivo.write(@contenido_de_archivos[:gemfile_clean])
        else
          archivo.write(@contenido_de_archivos[:gemfile])
      end
    end
  end

  def existe_carpeta_de_mismo_nombre_que_este_proyecto_en_el_directorio_actual?
    Dir.exists?("./#{@nombre_del_proyecto}")
  end

  def explicar_inconveniente
    @inconveniente || "No troubles.\n"
  end

  private

  def obtener_contenido_de_archivos
    File.open(File.expand_path('../../../data/contenido_de_archivos.cocot', __FILE__), 'r+b') do |archivo|
      @contenido_de_archivos = Marshal.load(archivo) #: Hash
    end
  end
end