require 'stringio'

RSpec.configure do |config|
  # Clear all arguments in ARGV
  config.before(:each) { ARGV.clear }

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
