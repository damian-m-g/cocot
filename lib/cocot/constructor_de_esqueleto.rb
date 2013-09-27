#encoding: utf-8

#Una instancia de esta clase es la encargada de construir el esqueleto del nuevo proyecto.
class ConstructorDeEsqueleto

  attr_reader :inconveniente

  #todo lo que sea 'proyect' debe ser reemplazado por el nombre original del proyecto
  SUBCARPETAS = %w{bin lib lib/proyect spec spec/proyect features features/support features/step_definitions doc}
  ARCHIVOS = %w{Changelog.md Gemfile Gemfile.lock License.md Rakefile ReadMe.md bin/proyect features/support/env.rb lib/proyect.rb spec/spec_helper.rb}

  #@param nombre_del_proyecto [String]. @return [TrueClass or FalseClass].
  def construir_esqueleto(nombre_del_proyecto)
    @nombre_del_proyecto = nombre_del_proyecto
    if !(existe_carpeta_de_mismo_nombre_que_este_proyecto_en_el_directorio_actual?)
      crear_carpeta_del_proyecto()
    else
      @inconveniente = "Skeletal structure can't be build. There's an existing folder in the working directory called #{@nombre_del_proyecto}.\n"
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
    SUBCARPETAS.collect {|carpeta| if carpeta.include?('proyect') then carpeta.sub('proyect', @nombre_del_proyecto) else carpeta end}.each do |carpeta|
      Dir.mkdir(carpeta)
      ::COCOT.salida.escribir('.')
    end
  end

  def crear_archivos
    ARCHIVOS.collect {|archivo| if archivo.include?('proyect') then archivo.sub('proyect', @nombre_del_proyecto) else archivo end}.each do |archivo|
      File.new(archivo, 'w+').close
      ::COCOT.salida.escribir('.')
    end
    ::COCOT.salida.escribir("\n")
  end

  def escribir_archivos
    obtener_contenido_de_archivos() #: Hash
    @contenido_de_archivos.each_pair do |nombre_del_archivo, contenido|
      File.open(nombre_del_archivo.to_s.sub('proyect', @nombre_del_proyecto), 'w+b') do |archivo|
        archivo.write(contenido.gsub('name_of_the_proyect', @nombre_del_proyecto))
      end
    end
  end

  def existe_carpeta_de_mismo_nombre_que_este_proyecto_en_el_directorio_actual?
    Dir.exists?("./#{@nombre_del_proyecto}")
  end

  def explicar_inconveniente
    @inconveniente || "No hubo inconvenientes.\n"
  end

  private

  def obtener_contenido_de_archivos
    File.open(File.expand_path('../../../data/contenido_de_archivos.cocot', __FILE__), 'r+b') do |archivo|
      @contenido_de_archivos = Marshal.load(archivo) #: Hash
    end
  end
end