$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

# Start code coverage
require 'simplecov'
SimpleCov.start do
  add_group 'Library',  'lib/'
  add_group 'Features', 'features/'
  add_group 'Specs',    'spec/'
end

# Load the application
require 'valet'
include Valet

# Configure RSpec
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
