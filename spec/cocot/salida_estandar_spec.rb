#encoding: utf-8

require 'spec_helper'


describe SalidaEstándar do

  before(:each) do
    @texto = 'texto'
    #emulo $stderr
    @stderr = double('stderr').as_null_object
  end

  describe '#escribir' do
    it 'escribe texto en $stderr' do
      @stderr.should_receive(:print).with(@texto)
      #creo el subject
      se = SalidaEstándar.new(@stderr)
      se.escribir(@texto)
    end

    it 'almacena el texto en si misma(es un #Array)' do
      se = SalidaEstándar.new(@stderr)
      se.escribir(@texto)
      se.should include('texto')
    end
  end
end