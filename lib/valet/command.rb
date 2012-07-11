module Valet
  class Command
    attr_reader :name, :options, :commands, :examples
    attr_accessor :aliases, :syntax, :summary, :description

    def initialize(name, &block)
      validate_name(name)
      @name     = name
      @action   = block
      @options  = Options.new
      @commands = Commands.new
      @examples = []
    end

    def action(&block)
      if block_given?
        validate_action(block)
        @action = block
      end

      @action
    end

    def execute(*operands)
      if action.arity == 0
        action.call
      elsif action.arity == 1
        action.call(options)
      else
        action.call(operands, options)
      end
    end

    private

    def validate_name(name)
      unless valid_name?(name)
        raise CommandError,
          "Name: '#{name}' must be a symbol"
      end
    end

    def valid_name?(name)
      name.is_a?(Symbol)
    end

    def validate_action(proc)
      unless valid_action?(proc)
        raise CommandError,
          "Action: '#{action}' may not have more than two block parameters"
      end
    end

    def valid_action?(proc)
      proc.arity <= 2 && proc.arity >= 0
    end
  end

  class CommandError < StandardError; end
end
