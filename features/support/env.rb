$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

# Start code coverage
require 'simplecov'
SimpleCov.start do
  add_group 'Library',  'lib/'
  add_group 'Features', 'features/'
  add_group 'Specs',    'spec/'
end

# Import Aruba's step definitions
require 'aruba/cucumber'
