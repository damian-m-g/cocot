#encoding: utf-8

#necesario para ejecutar los tests de minitest
require 'rake/testtask'
#necesario para ejecutar los tests de cucumber
require 'cucumber/rake/task'
#necesario para ejecutar los tests de rspec
require 'rspec/core/rake_task'

#################TAREAS#######################

#tarea para ejecutar los tests de minitest con `rake test`
Rake::TestTask.new do |t|
  #busca recursivamente bajo la carpeta test por archivos llamados test*
  t.pattern = 'test/**/test*.rb'
end

#tarea para ejecutar los tests de cucumber con `cucumber`
Cucumber::Rake::Task.new

#tarea para ejecutar cucumber wip(work in progress) con 'rake cucumber_wip'
desc 'Ejecuta cucumber wip'
task :cucumber_wip do
  system('cucumber --format progress --color --wip --tags @wip:3')
end

#tarea para ejecutar todos los tests de rspec con `rake spec`
RSpec::Core::RakeTask.new do |t|
  #opciones de rspec a correr
  t.rspec_opts = ['--color']
end

desc 'Genera documentación en RDoc'
task :rdoc do
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="doc" --exclude="features" --exclude="spec" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end

desc 'Genera data/contenido_de_archivos.cocot'
task :generar_contenido_de_archivos do
  require_relative('lib/cocot/salvador_de_contenidos')
  SalvadorDeContenidos.new.salvar_contenido_de_archivos
end

desc 'Build gem'
task :build_gem do
  system('gem build cocot.gemspec')
end