#encoding: utf-8

module COCOT; end

COCOT::CONTENIDO_DE_ARCHIVOS = {}

COCOT::CONTENIDO_DE_ARCHIVOS[:'bin/proyect'] = \
<<STR
#!/usr/bin/env ruby

require_relative '../lib/name_of_the_proyect'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'features/support/env.rb'] = \
<<STR
#if you respect the convention of a Ruby proyect layout then the next lines are fixed
$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'name_of_the_proyect'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'lib/proyect.rb'] = \
<<STR

STR

COCOT::CONTENIDO_DE_ARCHIVOS[:'spec/spec_helper.rb'] = \
<<STR
require 'name_of_the_proyect'


STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile] = \
<<STR
source 'https://rubygems.org'

gem 'rspec'
gem 'cucumber'
gem 'rake'
gem 'rdoc'
gem 'bundler'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_rspec_only] = \
<<STR
source 'https://rubygems.org'

gem 'rspec'
gem 'rake'
gem 'rdoc'
gem 'bundler'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_cucumber_only] = \
<<STR
source 'https://rubygems.org'

gem 'cucumber'
gem 'rake'
gem 'rdoc'
gem 'bundler'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_clean] = \
<<STR
source 'https://rubygems.org'

gem 'rake'
gem 'rdoc'
gem 'bundler'
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile] = \
<<STR
#necessary for minitest tests
require 'rake/testtask'
#necessary for cucumber tests
require 'cucumber/rake/task'
#necessary for rspec tests
require 'rspec/core/rake_task'

#################TASKS#######################

#to execute minitest tests with `rake test`
Rake::TestTask.new do |t|
  #search recursively under the folder test for files called test*. You may have to create the folder manually.
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
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="ext" --exclude="share" --exclude="doc" --exclude="features" --exclude="spec" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_rspec_only] = \
<<STR
#necessary for rspec tests
require 'rspec/core/rake_task'

#################TASKS#######################

#to execute all RSpec tests with `rake spec`
RSpec::Core::RakeTask.new do |t|
  #opciones de rspec a correr
  t.rspec_opts = ['--color']
end

desc 'to generate RDoc documentation'
task :rdoc do
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="ext" --exclude="share" --exclude="doc" --exclude="spec" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_cucumber_only] = \
<<STR
#necessary for cucumber tests
require 'cucumber/rake/task'

#################TASKS#######################

#to execute cucumber tests with `rake cucumber`
Cucumber::Rake::Task.new

#to execute cucumber wip(work in progress) with 'rake cucumber_wip'. It will kick you if you are working in more than 3 scenarios
#remember to tag each wip scenarios with @wip above the Scenario keyword in the implicit *.feature
desc 'Executes cucumber wip'
task :cucumber_wip do
  system('cucumber --format progress --color --wip --tags @wip:3')
end

desc 'to generate RDoc documentation'
task :rdoc do
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="ext" --exclude="share" --exclude="doc" --exclude="features" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_minitest_only] = \
<<STR
#necessary for minitest tests
require 'rake/testtask'

#################TASKS#######################

#to execute minitest tests with `rake test`
Rake::TestTask.new do |t|
  #search recursively under the folder test for files called test*. You may have to create the folder manually.
  t.pattern = 'test/**/test*.rb'
end

desc 'to generate RDoc documentation'
task :rdoc do
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="ext" --exclude="share" --exclude="doc" --exclude="test" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_clean] = \
<<STR
#################TASKS#######################

desc 'to generate RDoc documentation'
task :rdoc do
  system('rdoc --all --tab-width=1 --force-output --main="ReadMe.md" --exclude="bin" --exclude="data" --exclude="ext" --exclude="share" --exclude="doc" --exclude="cocot.gemspec" --exclude="Gemfile" --exclude="Gemfile.lock" --exclude="Rakefile"')
end
STR