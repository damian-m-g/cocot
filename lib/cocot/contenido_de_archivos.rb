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
# if you respect the convention of a Ruby proyect layout then the next lines are fixed
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
# ruby '~>3.0'

source 'https://rubygems.org'

group :development do
  gem 'rspec'
  gem 'cucumber'
  gem 'rake'
  gem 'yard'
end

group :production do
  
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_rspec_only] = \
<<STR
# ruby '~>3.0'

source 'https://rubygems.org'

group :development do
  gem 'rspec'
  gem 'rake'
  gem 'yard'
end

group :production do
  
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_cucumber_only] = \
<<STR
# ruby '~>3.0'

source 'https://rubygems.org'

group :development do
  gem 'cucumber'
  gem 'rake'
  gem 'yard'
end

group :production do
  
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:gemfile_clean] = \
<<STR
# ruby '~>3.0'

source 'https://rubygems.org'

group :development do
  gem 'rake'
  gem 'yard'
end

group :production do
  
end
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile] = \
<<STR
# necessary for minitest tests
require 'rake/testtask'
# necessary for cucumber tests
require 'cucumber/rake/task'
# necessary for rspec tests
require 'rspec/core/rake_task'
# necessary for yardoc task
require 'yard'

#################TASKS#######################

# to execute minitest tests with `rake test`
Rake::TestTask.new do |t|
  # search recursively under the folder test for files called test*. You may have to create the folder manually.
  t.pattern = 'test/**/test*.rb'
end

# to execute cucumber tests with `rake cucumber`
Cucumber::Rake::Task.new

# to execute cucumber wip(work in progress) with 'rake cucumber_wip'. It will kick you if you are working in more than 3 scenarios
# remember to tag each wip scenarios with @wip above the Scenario keyword in the implicit *.feature
desc 'Executes cucumber wip'
task :cucumber_wip do
  system('cucumber --format progress --color --wip --tags @wip:3')
end

# to execute all RSpec tests with `rake spec`
RSpec::Core::RakeTask.new do |t|
  # rspec options to run
  t.rspec_opts = ['--color']
end

# generate yard documentation
YARD::Rake::YardocTask.new {|t|}
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_rspec_only] = \
<<STR
# necessary for rspec tests
require 'rspec/core/rake_task'
# necessary for yardoc task
require 'yard'

#################TASKS#######################

# to execute all RSpec tests with `rake spec`
RSpec::Core::RakeTask.new do |t|
  # rspec options to run
  t.rspec_opts = ['--color']
end

# generate yard documentation
YARD::Rake::YardocTask.new {|t|}
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_cucumber_only] = \
<<STR
# necessary for cucumber tests
require 'cucumber/rake/task'
# necessary for yardoc task
require 'yard'

#################TASKS#######################

# to execute cucumber tests with `rake cucumber`
Cucumber::Rake::Task.new

# to execute cucumber wip(work in progress) with 'rake cucumber_wip'. It will kick you if you are working in more than 3 scenarios
# remember to tag each wip scenarios with @wip above the Scenario keyword in the implicit *.feature
desc 'Executes cucumber wip'
task :cucumber_wip do
  system('cucumber --format progress --color --wip --tags @wip:3')
end

# generate yard documentation
YARD::Rake::YardocTask.new {|t|}
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_minitest_only] = \
<<STR
# necessary for minitest tests
require 'rake/testtask'
# necessary for yardoc task
require 'yard'

#################TASKS#######################

# to execute minitest tests with `rake test`
Rake::TestTask.new do |t|
  # search recursively under the folder test for files called test*. You may have to create the folder manually.
  t.pattern = 'test/**/test*.rb'
end

# generate yard documentation
YARD::Rake::YardocTask.new {|t|}
STR

COCOT::CONTENIDO_DE_ARCHIVOS[:rakefile_clean] = \
<<STR
# necessary for yardoc task
require 'yard'

#################TASKS#######################

# generate yard documentation
YARD::Rake::YardocTask.new {|t|}
STR

COCOT::CONTENIDO_DE_ARCHIVOS['README.md'] = \
<<STR
# name_of_the_project_upcased



# Usage



# Contact


STR

COCOT::CONTENIDO_DE_ARCHIVOS['CHANGELOG.md'] = \
<<STR
# Changelog  
All notable changes to this project will be documented in this file.  
  
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),  
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).  
  
## [Unreleased] - current_date  
### Added  
- Pristine version.
STR