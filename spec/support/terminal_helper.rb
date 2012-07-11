require 'stringio'

RSpec.configure do |config|
  # Clear all remaining arguments in ARGV to make it testable
  config.before(:suite) { ARGV.clear }

  # Reroute STDOUT, STDERR and STDIN to testable streams
  config.before(:each) do
    $stdout = StringIO.new
    $stderr = StringIO.new
    $stdin  = StringIO.new
  end

  # Set STDOUT, STDERR and STDIN back to default
  config.after(:each) do
    $stdout = STDOUT
    $stderr = STDERR
    $stdin  = STDIN
  end
end
