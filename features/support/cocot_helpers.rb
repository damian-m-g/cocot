#encoding: utf-8

module CocotHelpers

  def cocot
    @cocot ||= Cocot.new
  end

  def nombre_del_proyecto
    @nombre_del_proyecto ||= cocot.instance_variable_get(:@juzgador_de_argumentos).cual_será_el_nombre_del_proyecto? #: String
  end
end

World(CocotHelpers)