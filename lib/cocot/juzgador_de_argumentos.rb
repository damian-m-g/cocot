#encoding: utf-8

class JuzgadorDeArgumentos

  ERRORES_CONOCIDOS = {ningun_argumento: "Error: cocot needs to know the name of the further proyect. `cocot '<name_of_the_proyect>'`.\n", \
    dos_o_mas_argumentos_como_nombre: "Error: cocot just need one argument: the name of the further proyect. If its name have more than a word you must put these inside ''.\n", \
    ayuda_y_esqueletizado_invocados_a_la_vez: "Error: what do you want to do? invoke the help or skeletonize? You can't do both things.\n"}

  #@param argumentos [Array].
  def juzgar_argumentos(argumentos)
    if argumentos.length.==(0)
      @error_presente_en_argumentos = :ningun_argumento #: Symbol
    elsif ((argumentos.length).!=(cantidad_de_argumentos_sin_help = (argumentos.select {|arg| arg.!=('--help')}.length))) && (argumentos.!=(['--help']))
      @error_presente_en_argumentos = :ayuda_y_esqueletizado_invocados_a_la_vez
    elsif cantidad_de_argumentos_sin_help.>(1)
      @error_presente_en_argumentos = :dos_o_mas_argumentos_como_nombre
    elsif argumentos[0].==('--help')
      @ayuda_solicitada = true
    else
      @nombre_del_proyecto = argumentos[0]
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