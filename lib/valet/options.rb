require 'set'

module Valet
  class Options < Set
    def [](name)
      find_option(name)
    end

    def method_missing(method_name, *args, &block)
      if (option = find_switch(method_name)) || (option = find_flag(method_name))
        option.value
      else
        super
      end
    end

    private

    def find_option(name)
      self.find { |option| name == option.name }
    end

    def find_switch(name)
      self.find { |option| name =~ /#{option.name}\?/ if option.switch? }
    end

    def find_flag(name)
      self.find { |option| name == option.name if option.flag? }
    end
  end
end
