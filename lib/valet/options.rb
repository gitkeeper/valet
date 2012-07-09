module Valet
  class Options < Set
    def method_missing(method_name, *args, &block)
      if (option = find_switch(method_name)) || (option = find_flag(method_name))
        option.value
      else
        super
      end
    end

    private

    def find_switch(name)
      self.find do |option|
        name =~ /#{option.name}\?/ if option.switch?
      end
    end

    def find_flag(name)
      self.find do |option|
        name == option.name if option.flag?
      end
    end
  end
end
