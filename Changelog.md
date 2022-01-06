1.1.4
-----

* Gemfiles requirement for ruby version was updated to "~>3.0".
* Requires of the bundler gem were dropped from Gemfiles since now it's bundled into Ruby standard libraries.
* Requires of the rake gem were dropped from Gemfiles since now it's bundled into Ruby standard libraries.
* Version "0.1.0" in the CHANGELOG was replaced for "Unreleased".
* Added "Usage" and "Contact" info to the README template. 

1.1.3
-----

* ReadMe.md is no longer an empty file. Now it contains a title: the project name upcased.
* ReadMe.md is now README.md to get adapted to VCS conventions.
* Changelog.md is no longer an empty file. Now it has references to "Keep a CHANGELOG" file conventions and you're expected to get adapted to write good and consistent CHANGELOG files following that guideline.
* Changelog.md is now CHANGELOG.md to get adapted to VCS conventions.
* License.md is now LICENSE.md to get adapted to VCS conventions.
* RDoc is pretty much dead and ugly compared to Yard on these days. Yard is supposed to be used now as documenting system. Because of that, it's now included inside any Gemfile as a :development dependency. The RDoc main rake task is now replaced by yard's main rake task.
* The Gemfile got updated to separate what is :development dependencies from the :production dependencies. It also replaced rdoc for yard as documenting system dependency.
* Better in-code comments. Before everything looked like #comment, now it contains a space before the first comment character, such as the Ruby conventions suggest.

1.1.2
-----

* Fixed some misspelling on feedback.
* Fixed issue in Gemfile generated. Even when you chosen --clean option, Gemfile tried to require rspec and cucumber gems, not anymore.

1.1.1
-----

* Changed :rdoc rake task in Rakefile generated. Documentation now output properly: ignoring cucumber, rspec and minitest code; also ignoring irrelevant folders such as "bin", "data", "doc", "ext" and "share". The only files looked for RDoc on main working directory are "Changelog.md", "License.md" and "ReadMe.md". "ReadMe.md" is now settled as the main content to show when you open "index.html" RDoc generated file.

1.1.0
-----
* Changed LICENSE.md
* Changed ReadMe.md
* Files generated does not have anymore "\#encoding: utf-8" on its first line
* New options added: --full, --rspec-only, --cucumber-only, --minitest-only, --clean
* Rakefile content is generated according to the options passed
* Improved feedback from cocot

1.0.1
-----
* Changed LICENSE.md
* When you install cocot no rdoc is built, it's not needed
* Fixed few misspelled words in the README.md


1.0.0
-----
* First release