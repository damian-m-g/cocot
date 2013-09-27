#encoding: utf-8

module COCOT; end

COCOT::CONTENIDO_DE_ARCHIVOS = {}

COCOT::CONTENIDO_DE_ARCHIVOS[:'bin/proyect'] = \
<<STR
#!/usr/bin/env ruby
#encoding: utf-8

require_relative '../lib/name_of_the_proyect'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'features/support/env.rb'] = \
<<STR
#encoding: utf-8

#if you respect the convention of a Ruby proyect layout then the next lines are fixed
$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'name_of_the_proyect'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'lib/proyect.rb'] = \
<<STR
#encoding: utf-8
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'spec/spec_helper.rb'] = \
<<STR
#encoding: utf-8

require 'name_of_the_proyect'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'Gemfile'] = \
<<STR
source 'https://rubygems.org'

gem 'rspec'
gem 'cucumber'
gem 'rake'
gem 'rdoc'
gem 'bundler'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'Rakefile'] = \
<<STR
#encoding: utf-8

#necesary for minitest tests
require 'rake/testtask'
#necesary for cucumber tests
require 'cucumber/rake/task'
#necesary for rspec tests
require 'rspec/core/rake_task'

#################TASKS#######################

#to execute minitest tests with `rake test`
Rake::TestTask.new do |t|
  #search recursively under the folder test for files called test*. You have to create the folder manually.
  t.pattern = 'test/**/test*.rb'
end

#to execute cucumber tests with `rake cucumber`
Cucumber::Rake::Task.new

#to execute cucumber wip(work in progress) with 'rake cucumber_wip'. It will kick you if you are working in more than 3 scenarios
#remember to tag each wip scenarios with @wip above the Scenario keyword in the implicit *.feature
desc 'Executes cucumber wip'
task :cucumber_wip do
  system('cucumber --format progress --color --wip --tags @wip:3')
end

#to execute all RSpec tests with `rake spec`
RSpec::Core::RakeTask.new do |t|
  #opciones de rspec a correr
  t.rspec_opts = ['--color']
end

desc 'to generate RDoc documentation'
task :rdoc do
  system('rdoc --all --tab-width=1 --format=darkfish --op=doc --force-output')
end
STR