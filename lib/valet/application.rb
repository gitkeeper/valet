module Valet
  class Application
    class << self
      attr_accessor :name, :version, :authors, :copyright, :license

      def commands
        @commands ||= Commands.new
      end

      def command(name, &block)
        command = Command.new(name)
        block.call(command) if block_given?
        commands << command
      end

      def start(arguments = ARGV)
        new(arguments)
      end
    end

    attr_reader :arguments

    def initialize(arguments = ARGV)
      @arguments = arguments
    end
  end
end
