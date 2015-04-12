#encoding: utf-8

#hooks del *.feature correspondiente
Around('@carpeta_existente') do |escenario, bloque|
  directorio_implicito = 'Proyecto'
  unless Dir.exists?(directorio_implicito) then Dir.mkdir(directorio_implicito) end
  bloque.call
  if Dir.exists?(directorio_implicito) then FileUtils.remove_dir(directorio_implicito, true) end
end

Before do |escenario|
  #en el modelo del dominio ::COCOT es utilizada. Apunta a la única instancia Cocot, la aplicación en si.
  ::COCOT = cocot()
end

#definiciones de pasos
Dado(/^que aún no inicié la aplicación,$/) do
  cocot()
end

Cuando(/^ejecuto el comando: "([^"]*)",$/) do |comando_ejecutado|
  #extirpo la palabra 'cocot' venida del *.feature y otras
  argumentos = comando_ejecutado.split.select {|palabra| (palabra.!=('cocot')) && (palabra.!=('\'\'')) && (palabra.!=('""'))} #: Array
  #le digo a cocot que juzgue los argumentos pasados por el usuario al iniciar la aplicación
  cocot.limpiar_argumentos(argumentos)
  cocot.juzgar_argumentos
end

Entonces(/^debo recibir en consola: "([^"]*)"[.,]$/) do |salida|
  cocot.interrogar_juzgador
  #el atributo salida es un #Array, cada item es un #String
  cocot.instance_variable_get(:@salida).should include(salida.+("\n"))
end

Entonces(/^a continuación: "([^"]*)", terminando el programa.$/) do |salida|
  begin
    cocot.accionar.should raise_error(SystemExit)
  #cucumber falla si algún bloque levanta una excepción y no es rescatada, asi que...
  rescue SystemExit
  end
end

Entonces(/^el programa debe terminarse\.$/) do
  begin
    cocot.accionar.should raise_error(SystemExit)
  #cucumber falla si algún bloque levanta una excepción y no es rescatada, asi que...
  rescue SystemExit
  end
end

Entonces(/^debo recibir en consola información que me ayude a comprender el funcionamiento de cocot,$/) do
  cocot.interrogar_juzgador
  cocot.instance_variable_get(:@ayuda_invocada).should be true
end

Cuando(/^ejecuto el comando: "cocot 'Proyecto Fu Fu'", cocot entiende que el nombre del proyecto será "Proyecto Fu Fu",$/) do
  #le digo a cocot que juzgue los argumentos pasados por el usuario al iniciar la aplicación
  cocot.limpiar_argumentos(['Proyecto Fu Fu'])
  cocot.juzgar_argumentos
end

Dado(/^que existe la carpeta "([^"]*)" en el directorio actual,$/) do |carpeta|
  Dir.exists?(carpeta).should be true
end

Entonces(/^debo ver generada además de las carpetas convencionales: '\.\/data\/', '\.\/share\/' y '\.\/ext\/'\.$/) do
  nombre_del_proyecto = 'ProyectoFu'
  #si estoy dentro del directorio del proyecto...
  if Dir.getwd[(-(nombre_del_proyecto.length))..-1].==(nombre_del_proyecto)
    existen_carpetas_extras?.should be true
  else
    #si no lo estoy me paso
    Dir.chdir('./ProyectoFu')
    existen_carpetas_extras?.should be true
    #terminado el test..
    Dir.chdir('..')
  end
end

#metodo helper del anterior step definition
def existen_carpetas_extras?
  archivos_en_wd = Dir['./*'] #: Array
  if (archivos_en_wd.include?('./data')) and (archivos_en_wd.include?('./share')) and (archivos_en_wd.include?('./ext'))
    true
  else
    false
  end
end