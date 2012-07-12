require 'set'

module Valet
  class Options < Set
    def [](name)
      find_option(name)
    end

    def method_missing(method_name, *args, &block)
      if /(?<option_name>.+)\?\z/ =~ method_name
        option = find_switch(option_name.to_sym)
      else
        option = find_flag(method_name.to_sym)
      end

      option ? option.value : super
    end

    private

    def find_option(name)
      self.find { |option| name == option.name }
    end

    def find_switch(name)
      self.find { |option| name == option.name if option.switch? }
    end

    def find_flag(name)
      self.find { |option| name == option.name if option.flag? }
    end
  end
end
