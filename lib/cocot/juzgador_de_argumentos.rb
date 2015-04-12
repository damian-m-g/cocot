#encoding: utf-8

class JuzgadorDeArgumentos

  ERRORES_CONOCIDOS = {ningun_argumento: "Error: cocot needs to know the name of the further proyect. `cocot '<name_of_the_proyect>'`.\n", \
    dos_o_mas_argumentos_como_nombre: "Error: cocot just need one argument: the name of the further proyect. If its name have more than a word you must put these inside "".\n"}

  attr_reader :full, :modo

  #@param argumentos [Array].
  def juzgar_argumentos(argumentos)
    if argumentos.length.==(0)
      @error_presente_en_argumentos = :ningun_argumento #: Symbol
    elsif argumentos.include?('--help')
      @ayuda_solicitada = true
    else
      # voy a limpiar los argumentos opciones para que me quede(n) el potencial nombre del proyecto
      if(_argumentos = argumentos.select {|i| i[0..1].!=('--')}).length == 1
        @full = \
          if argumentos.include?('--full')
            ::COCOT.salida.escribir("\"Full\" option detected.\n")
            true
          else
            false
          end
        @modo = \
          if argumentos.include?('--rspec-only')
            ::COCOT.salida.escribir("\"RSpec only\" option detected.\n")
            '--rspec-only'
          elsif argumentos.include?('--cucumber-only')
            ::COCOT.salida.escribir("\"Cucumber only\" option detected.\n")
            '--cucumber-only'
          elsif argumentos.include?('--minitest-only')
            ::COCOT.salida.escribir("\"Minitest only\" option detected.\n")
            '--minitest-only'
          elsif argumentos.include?('--clean')
            ::COCOT.salida.escribir("\"Clean\" option detected.\n")
            '--clean'
          else
            ::COCOT.salida.escribir("Attempting to make a normal instalation(RSpec and Cucumber support).\n")
            nil
          end
        @nombre_del_proyecto = _argumentos[0].strip
      else
        @error_presente_en_argumentos = :dos_o_mas_argumentos_como_nombre #: Symbol
      end
    end
  end


  def hubo_algun_error?
    true if @error_presente_en_argumentos
  end

  def describime_el_error
    if hubo_algun_error?
      return ERRORES_CONOCIDOS[@error_presente_en_argumentos]
    end
  end

  def fue_la_ayuda_solicitada?
    if @ayuda_solicitada then true else false end
  end

  def cual_será_el_nombre_del_proyecto?
    @nombre_del_proyecto || "No fue definido.\n"
  end
end