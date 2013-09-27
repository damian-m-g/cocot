cocot
=====

 Sometimes you have a good 'no-rails' idea, and say for yourself: "what a good idea!", what mostly of the time is followed by "okay, but...I can't, I'm in many proyects and I had to create all the folder and files stuff, will take me 15 minutes, or more, so no". You are lazy and you know it. We are great builders of tools which makes our life easy, **cocot** is one of those. **cocot** is a very simple tool that puts you to work in one second, you just have to tell him which will be the name of your proyect and it's done, it creates you the structure of your **BDD** proyect.

It supposes that you...
-----------------------

 use RSpec and Cucumber for BDD developing, so it creates the conventional files and folders for work with.

How can I install it?
-----------------

 By rubygems with `gem install cocot`.

How can I use it?
-----------------

 `cocot NameOfTheProyect` or `cocot "name of the proyect"`. Will build the skeleton in the current working directory, so be aware of be positioned where you want your proyect to be.

Gemfile
-------

  If you don't have **RSpec** and **Cucumber** installed on your system(or want to update them) you can do it by calling `bundle install` standing on the main folder of your proyect created by **cocot**. If you neither have **bundler** you will need to install it by calling `gem install bundler`.

Rakefile
--------

 **cocot** packs few pre-defined **rake** tasks:

 * `rake cucumber` : same like `cucumber`
 * `rake cucumber_wip` : same like `cucumber --format progress --color --wip --tags @wip:3`, specially for order
 * `rake spec` : same like `spec --color`
 * `rake test` : run minitest tests
 * `rake rdoc` : create a doc folder with **RDoc** documentation

Skeleton
--------

 **cocot** builds:

<pre>
 bin\
 |   proyect*
 doc\
 features\
 |        step_definitions\
 |        support\
 |        |       env.rb
 lib\
 |   proyect*
 |   proyect*.rb
 spec\
 |    proyect*
 |    spec_helper.rb
 Changelog.md
 Gemfile
 Gemfile.lock
 License.md
 Rakefile
 ReadMe.md
</pre>

 *proyect is replaced by the name of your proyect

TODO
----

 * --full option. It builds you extra folders, like "Data", "Share", and "Test".
 * --git-init option. Initialize a git repository(you will need to have **Git** in your system), and stash all the files created by **cocot**.
