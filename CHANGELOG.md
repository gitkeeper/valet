# Valet - CHANGELOG

### 0.0.5 / 06.07.2012

* Allowed jruby and rbx to fail a build on Travis

### 0.0.4 / 06.07.2012

* Updated configuration of Travis to use jruby and rbx in 19mode

### 0.0.3 / 06.07.2012

* Feature "Version" roughly implemented to get started
* Added namespace to Valet's version module inside the specs (Rubinius, JRuby)
* Fixed syntax for RSpec's filter config (Rubinius, JRuby)
* Small syntax improvements and refactorings

### 0.0.2 / 03.07.2012

* Added a post-install message to `valet.gemspec` to inform users of Valet's
  current development status
* RSpec examples may now be tagged with :focus to run them exclusively
* RSpec will now load all support files inside `spec/support automatically
* Refined specs for `Valet::VERSION`
* Reworked the README and fixed some typos

### 0.0.1 / 02.07.2012

* Initial commit
