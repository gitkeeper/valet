module Valet
  class Command
    attr_reader :name, :options, :commands
    attr_accessor :summary, :description

    def initialize(name, &block)
      @name = name
      @action = block
      @options = Options.new
      @commands = Commands.new
    end

    def action(&block)
      @action = block if block_given?
      @action
    end

    def execute(*operands)
      action.arity == 0 ? action.call : action.call(options, *operands)
    end

    def option(name, params = {})
      if params[:type]
        options << Option::Flag.create(name, params)
      else
        options << Option::Switch.create(name, params)
      end
    end
  end
end
