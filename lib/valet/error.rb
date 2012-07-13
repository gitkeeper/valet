module Valet
  class Error < StandardError; end

  class CommandError < Error; end
  class OptionError < Error; end
end
