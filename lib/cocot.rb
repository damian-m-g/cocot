#encoding: utf-8

#acá se requieren todos los archivos del código fuente, por ejemplo una línea podría ser "require 'cocot/archivo.rb'"...

require_relative 'cocot/cocot'
require_relative 'cocot/juzgador_de_argumentos'
require_relative 'cocot/salida_estandar'
require_relative 'cocot/constructor_de_esqueleto'

#ejecuto la aplicación
begin
  #ejecuto lo siguiente solo si este archivo fue ejecutado desde 'cocot'. Evado que cucumber o rspec lo ejecuten.
  if File.basename($0).==('cocot')
    COCOT = Cocot.new
    COCOT.limpiar_argumentos(ARGV)
    COCOT.juzgar_argumentos
    COCOT.interrogar_juzgador
    COCOT.accionar
  end
rescue => e
  warn('###############################################################################################')
  warn("ATTENTION: An exception of kind #{e.class} was raised by cocot with this message: #{e.message}.")
  warn('This is the backtrace:')
  e.backtrace.each do |trace|
    warn(trace)
  end
  warn('###############################################################################################')
  warn('Please provide me with this message at https://github.com/IgorJorobus/cocot/issues , thank you.')
  warn('###############################################################################################')
end