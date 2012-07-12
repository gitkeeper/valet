# Valet - CHANGELOG

### 0.0.8 / 11.07.2012

__Started over with a new approach__, designing business objects and API first

* Made an output notice in `bin/valet` to notify the user of Valet's current
  development status
* Implemented core classes with basic business rules
  * `Application`
  * `Command`
  * `Options`
  * `Option::Switch`
  * `Option::Flag`
* New RSpec `expect` syntax and improved support files to help with testing
  stdout, stderr and stdin streams
* Playing around with Travis (JRuby and Rubinius compatibility seems to fail on
  me because of C-extensions and code coverage...)

### 0.0.7 / 08.07.2012

* JRuby and Rubinius still won't build successfully on Travis. Allowed them once
  again to build with failures.

### 0.0.6 / 08.07.2012

* New GNU compliant feature: __Version__
* Basic Mustache views and templates integration
* Postponed Valet's own CLI in favor of creating a general API first
* Minor improvements to the development and testing environment
* Refactored features and step definitions
* New skeleton feature for next iteration: __Help__

### 0.0.5 / 06.07.2012

* Allowed JRuby and Rubinius to fail a build on Travis

### 0.0.4 / 06.07.2012

* Updated configuration of Travis to use JRuby and Rubinius in `19mode`

### 0.0.3 / 06.07.2012

* Feature __Version__ roughly implemented to get started
* Added namespace to Valet's version module inside the specs (Rubinius, JRuby)
* Fixed syntax for RSpec's filter config (Rubinius, JRuby)
* Small syntax improvements and refactorings

### 0.0.2 / 03.07.2012

* Added a post-install message to `valet.gemspec` to inform users of Valet's
  current development status
* RSpec examples may now be tagged with `:focus` to run them exclusively
* RSpec will now load all support files inside `spec/support` automatically
* Refined specs for `Valet::VERSION`
* Reworked the `README.md` and fixed some typos

### 0.0.1 / 02.07.2012

* Initial commit
