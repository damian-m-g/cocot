#encoding: utf-8

#Clase principal de la aplicación.
class Cocot

  attr_reader :salida

  def initialize
    @salida = SalidaEstándar.new($stdout)
  end

  #@param argumentos [Array]. Se quieren limpiar todos aquellos argumentos vacíos, como por ejemplo aquellos que surgen al pasar '' o "" en la línea de comandos.
  def limpiar_argumentos(argumentos)
    @argumentos = argumentos.select {|arg| arg.strip.length.!=(0)} #: Array
  end

  #@param argumentos [Array].
  def juzgar_argumentos
    @juzgador_de_argumentos = JuzgadorDeArgumentos.new #: JuzgadorDeArgumentos
    @juzgador_de_argumentos.juzgar_argumentos(@argumentos)
  end

  #Interroga al juzgador de argumentos en búsqueda de saber si hubo algún error en ellos.
  def interrogar_juzgador
    if @juzgador_de_argumentos.hubo_algun_error?
      @error_existente = true
      @salida.escribir(@juzgador_de_argumentos.describime_el_error)
    elsif @juzgador_de_argumentos.fue_la_ayuda_solicitada?
      @ayuda_invocada = true
      mostrar_ayuda_en_pantalla()
    else
      @salida.escribir("Building skeletal structure for #{@nombre_del_proyecto = @juzgador_de_argumentos.cual_será_el_nombre_del_proyecto?}.\n")
    end
  end

  #El "accionar" de parte del programa se da una sola vez, luego del interrogatorio al juzgador.
  def accionar
    exit(false) if @error_existente
    exit(true) if @ayuda_invocada
    #llegado a este punto se entiende que el usuario ingresó correctamente el comando de inicio, aunqué puede que el constructor de esqueleto encuentre un problema
    unless construir_esqueleto() then exit(false) end
    #todo anduvo bien
    true
  end

  def construir_esqueleto
    @constructor_de_esqueleto = ConstructorDeEsqueleto.new
    #si la siguiente acción tiene éxito devuelve true, de otra forma false, lo cual quiere decir que hubo un problema
    if @constructor_de_esqueleto.construir_esqueleto(@nombre_del_proyecto)
      @salida.escribir("Structure builded. Have fun developing! :)\n")
      true
    else
      @salida.escribir(@constructor_de_esqueleto.explicar_inconveniente)
      false
    end
  end

  def mostrar_ayuda_en_pantalla
    msj_de_ayuda = "cocot builds the skeleton layout of your BDD proyects. You just have to give him the name of your proyect like this: `cocot \"name of the proyect\"`.\n"
    @salida.escribir(msj_de_ayuda)
  end
end