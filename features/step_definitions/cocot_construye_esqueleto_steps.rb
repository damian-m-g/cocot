#encoding: utf-8

Dado(/^que el usuario ingresó correctamente el comando para esqueletizar su nuevo proyecto, por ejemplo: "cocot Proyecto",$/) do
  cocot.limpiar_argumentos(['Proyecto'])
  cocot.juzgar_argumentos
  cocot.interrogar_juzgador
  (cocot.instance_variable_get(:@error_existente).should_not be true) && (cocot.instance_variable_get(:@ayuda_invocada).should_not be true)
end

Cuando(/^origino sus carpetas,$/) do
  #si todo andubo bien, en el accionar se genera el esqueleto
  cocot.accionar
end

Entonces(/^debo encontrar creada una carpeta con nombre "Proyecto",$/) do
  Dir.exists?("#{Dir.pwd}/#{nombre_del_proyecto()}").should be true
end

Entonces(/^dentro de ella debo encontrarme con la siguiente estructura de carpetas creadas:$/) do |carpetas|
  viejo_directorio_de_trabajo = Dir.pwd #: String
  #me muevo una carpeta hacia adelante
  Dir.chdir("./#{nombre_del_proyecto()}")
  #tiene que haber lo siguiente
  archivos_y_carpetas = %W{ Changelog.md
                            Gemfile
                            Gemfile.lock
                            License.md
                            Rakefile
                            ReadMe.md
                            bin
                              bin/#{nombre_del_proyecto()}
                            doc
                            features
                              features/step_definitions
                              features/support
                                features/support/env.rb
                            lib
                              lib/#{nombre_del_proyecto()}
                              lib/#{nombre_del_proyecto()}.rb
                            spec
                              spec/#{nombre_del_proyecto()}
                              spec/spec_helper.rb }

  Dir.glob('**/**/*').sort.should be === archivos_y_carpetas.sort
  #vuelvo al viejo directorio de trabajo
  Dir.chdir('..')
  #elimino todas las carpetas y archivos creados
  FileUtils.remove_dir("./#{nombre_del_proyecto}", true)
end
