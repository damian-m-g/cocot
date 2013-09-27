#encoding: utf-8

require 'spec_helper'


describe Cocot do

  it 'extrae los argumentos que considera útiles' do
    argv = [' ', 'argumento_1', 'argumento_2']
    subject.limpiar_argumentos(argv).should be == ['argumento_1', 'argumento_2']
  end

  before(:each) do
    ::COCOT = subject()
    @argv = ['Nombre de la aplicación']
    subject.limpiar_argumentos(@argv)
  end

  it 'crea un JuzgadorDeArgumentos' do
    subject.juzgar_argumentos
    subject.instance_variable_get(:@juzgador_de_argumentos).should_not be_nil
  end

  it 'manda a juzgar los argumentos proveidos por el usuario' do
    #si no hay error devuelve el nombre de la aplicación
    subject.juzgar_argumentos.should be @argv[0]
  end

  it 'interroga al juzgador preguntándole cual fue el resultado del juicio de argumentos' do
    subject.juzgar_argumentos
    subject.interrogar_juzgador
    subject.instance_variable_get(:@salida).should include("Building skeletal structure for Nombre de la aplicación.\n")
  end

  it 'acciona mediante comenzar a construir el esqueleto si los argumentos fueron correctos' do
    subject.juzgar_argumentos
    subject.interrogar_juzgador
    subject.accionar.should be true
    #elimino la carpeta generada al llamar accionar()
    if Dir.exists?(dir = "./#{@argv[0]}") then FileUtils.remove_dir(dir, true) end
  end

  before(:each) {}

  it 'muestra ayuda en pantalla si el usuario hizo correctamente la petición' do
    argv = ['--help']
    subject.limpiar_argumentos(argv)
    subject.juzgar_argumentos
    subject.should_receive(:mostrar_ayuda_en_pantalla)
    subject.interrogar_juzgador
  end

  it 'acciona mediante salir de la aplicación si los argumentos no fueron correctos' do
    begin
      argv = ['argumentos', 'no', 'correctos']
      subject.limpiar_argumentos(argv)
      subject.juzgar_argumentos
      subject.interrogar_juzgador
      subject.accionar.should raise_error(SystemExit)
    rescue SystemExit
    end
  end
end