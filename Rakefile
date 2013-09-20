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
Cucumber::Rake::Task.new do |t|
  #opciones de cucumber a correr
  t.cucumber_opts = %w{--format pretty --color}
end

#tarea para ejecutar cucumber wip(work in progress) con 'rake cucumber_wip'
desc 'Ejecuta cucumber wip'
task :cucumber_wip do
  Cucumber::Rake::Task.new do |t|
    #opciones de rspec a correr
    t.rspec_opts = %w{--format pretty --color --wip @wip:3}
  end
end

#tarea para ejecutar todos los tests de rspec con `rake spec`
RSpec::Core::RakeTask.new do |t|
  #opciones de rspec a correr
  t.rspec_opts = ['--color']
end

desc 'Genera documentación en RDoc'
task :rdoc do
  system('rdoc --all --tab-width=1 --format=darkfish --op=doc --force-output')
end

