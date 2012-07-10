module Valet
  class Command
    attr_reader :name, :options
    attr_accessor :syntax, :summary, :description

    def initialize(name, &block)
      @name     = name
      @action   = block
      @options  = Options.new
    end

    def action(&block)
      @action = block if block_given?
      @action
    end

    def option(name, params = {})
      if params[:type]
        options << Option::Flag.new(name, params)
      else
        options << Option::Switch.new(name, params)
      end
    end

    def execute(*operands)
      action.arity == 0 ? action.call : action.call(options, *operands)
    end
  end
end
