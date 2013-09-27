#encoding: utf-8

require 'spec_helper'


describe JuzgadorDeArgumentos do
  describe '#juzgar_argumentos' do
    it 'reconoce si ningún argumento le fue pasado' do
      subject.juzgar_argumentos([]).should be :ningun_argumento
    end

    it 'reconoce si se intento invocar ayuda y a la vez se pasaron mas argumentos' do
      subject.juzgar_argumentos(['--help', 'Proyecto']).should be :ayuda_y_esqueletizado_invocados_a_la_vez
    end

    it 'reconoce si se pasaron mas de un argumento como nombre del proyecto' do
      subject.juzgar_argumentos(['Dos', 'Nombres']).should be :dos_o_mas_argumentos_como_nombre
    end

    it 'reconoce cuando la ayuda fue invocada correctamente' do
      subject.juzgar_argumentos(['--help']).should be true
    end

    it 'reconoce si no hubo error alguno' do
      subject.juzgar_argumentos(['Proyecto']).should be_an_instance_of(String)
    end
  end

  context 'luego de juzgar argumentos' do
    it 'sabe si hubo algún error' do
      subject.juzgar_argumentos(['A', 'B'])
      subject.hubo_algun_error?.should be true
    end

    it 'y describirlo' do
      subject.juzgar_argumentos(['--help', 'A', 'A'])
      subject.describime_el_error.should be_an_instance_of(String)
    end

    it 'sabe si no lo hubo' do
      subject.juzgar_argumentos(['Nombre'])
      subject.hubo_algun_error?.should be nil
    end

    it 'si no hubo no puede describirlo' do
      subject.juzgar_argumentos(['Nombre bien pasado'])
      subject.describime_el_error.should be nil
    end

    it 'responde si la ayuda fue solicitada' do
      subject.juzgar_argumentos(['--help'])
      subject.fue_la_ayuda_solicitada?.should be true
    end

    it 'o no' do
      subject.juzgar_argumentos(['Nombre'])
      subject.fue_la_ayuda_solicitada?.should be false
    end

    it 'dice cual es el nombre del proyecto si es que fue definido en el argumento' do
      subject.juzgar_argumentos(['Secreto'])
      expect {subject.cual_será_el_nombre_del_proyecto?}.to be {'Secreto'}
    end

    it 'si no fue definido lo expresa' do
      subject.juzgar_argumentos([])
      expect {subject.cual_será_el_nombre_del_proyecto?}.to be {'No fue definido'}
    end
  end
end