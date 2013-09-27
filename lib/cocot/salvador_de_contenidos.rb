#encoding: utf-8

require_relative 'contenido_de_archivos'

#Clase solo utilizada para el desarrollo de cocot.
class SalvadorDeContenidos

  #Genera ./data/contenido_de_archivos.cocot , un archivo binario con el contenido de los contenidos que tendrán los archivos generados por cocot.
  def salvar_contenido_de_archivos
    puts "Creando carpeta data si no existe."
    unless Dir.exists?('data') then Dir.mkdir('data') end
    puts "Creando contenido_de_archivos.cocot."
    File.open('data/contenido_de_archivos.cocot', 'w+b') do |archivo|
      Marshal.dump(COCOT::CONTENIDO_DE_ARCHIVOS, archivo)
    end
    puts "Creado."
  end
end


