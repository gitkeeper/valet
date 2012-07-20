require 'set'

module Valet
  class Commands < Set
    def [](name)
      self.find { |command| name == command.name }
    end
  end
end
