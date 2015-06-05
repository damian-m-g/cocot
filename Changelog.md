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