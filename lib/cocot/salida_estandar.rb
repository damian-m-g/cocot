#encoding: utf-8

class SalidaEstándar < Array

  #@param salida [IO]. Inicializa la salida estándar de la aplicación.
  def initialize(salida)
    @salida = salida
  end

  #@param texto [String]. Escribe determinado *texto* en la @salida.
  def escribir(texto)
    self.<<(texto)
    @salida.print(texto)
  end
end