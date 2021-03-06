$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# Start code coverage
require 'simplecov'
SimpleCov.start do
  add_group 'Library',  'lib/'
  add_group 'Features', 'features/'
  add_group 'Specs',    'spec/'
end

# Load all support files inside RSpec's support directory
Dir[File.expand_path('spec/support/**/*.rb')].each { |file| require file }

# Load the application
require 'valet'
include Valet

# Configure RSpec
RSpec.configure do |config|
  # Ensure usage of RSpec's new expectation syntax
  config.expect_with(:rspec) { |c| c.syntax = :expect }

  # Metadata keys can be written as ":symbol" instead of "symbol: true"
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Use a ":focus" tag for running only specific example(s)
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
