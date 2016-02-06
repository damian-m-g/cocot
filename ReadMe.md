cocot
=====

 Sometimes you have a good 'no-rails' idea, and say for yourself: "what a good idea!", what mostly of the time is followed by "okay, but...I can't, I'm in many proyects and I had to create all the folder and files stuff, have to check out the file convention arragment, will take me 10 minutes, so no". You are lazy and you know it. We are great builders of tools which make our life easy, **cocot** is one of those. **cocot** is a very simple tool that puts you to work in one second, you just have to tell him which will be the name of your proyect and it's done, it creates you the structure of your **BDD/TDD/"free of tests"** proyect.

It supposes that you...
-----------------------

 may use **RSpec** and/or **Cucumber** and/or **minitest** for **BDD/TDD** developing, so it creates the conventional files and folders for work with.

How can I install it?
-----------------

 By rubygems with `gem install cocot`.

How can I use it?
-----------------

 `cocot NameOfTheProyect` or `cocot "name of the proyect"`. Will build the skeleton in the current working directory, so be aware of be positioned where you want your proyect to be.

Gemfile
-------

  If you don't have **RSpec** and **Cucumber** installed on your system(or want to update them) and want to use them you can do it by calling `bundle install` standing on the main folder of your proyect created by **cocot**. If you neither have **bundler** you will need to install it by calling `gem install bundler`.

Rakefile
--------

**cocot** packs few pre-defined **rake** tasks on standard mode:

* `rake cucumber` : same like `cucumber`
* `rake cucumber_wip` : same like `cucumber --format progress --color --wip --tags @wip:3`, specially for order
* `rake spec` : same like `spec --color`
* `rake test` : run minitest tests
* `rake rdoc` : same like `rdoc --all --tab-width=1 --format=darkfish --op=doc --force-output`, create a doc folder with **RDoc** documentation

If you pass some option(see below) to the program, the rake task list may be reduced.

Options
-------

Version 1.1.0 introduces few nice options:

* **--full** Builds these extra-folders: "share", "ext" and "data". If your project is kind of big, you may use them for order.

Next ones can be played as solo optionally in conjunction with the above one:

* **--rspec-only** Builds the standard skeleton minus the folders and files related to Cucumber.
* **--cucumber-only** Builds the standard skeleton minus the folders and files related to RSpec.
* **--minitest-only** Builds the standard skeleton without the support for RSpec and Cucumber and adds the folder "test" with the purpose of placing minitest tests there.
* **--clean** Builds the standard skeleton without the support for RSpec and Cucumber. This option may be fine for very small projects, which will have no unit testing at all.

Standard skeleton
-----------------

 By default **cocot** builds support for **RSpec** and **Cucumber**:

<pre>
 bin\
 |   proyect*
 doc\
 features\
 |        step_definitions\
 |        support\
 |        |       env.rb
 lib\
 |   proyect*\
 |   proyect*.rb
 spec\
 |    proyect*\
 |    spec_helper.rb
 Changelog.md
 Gemfile
 Gemfile.lock
 License.md
 Rakefile
 ReadMe.md
</pre>

 *proyect is replaced by the name of your proyect


Notes
-----

 Only tested on Windows. Should work in most operative systems.

License
-------

Copyright (c) 2016 cocot

 Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software with the rights to use, copy, modify, merge, publish and distribute.
 This software can not be sold, can't get money from it. In case you want to 
distribute it around please mention the author.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
