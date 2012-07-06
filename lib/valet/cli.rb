require 'valet'

module Valet
  class CLI
    extend Valet::Application

    self.name = 'Valet'
    self.version = Valet::VERSION::STRING
    self.copyright = 'Copyright (c) 2012 Alexander Baumann'
    self.license = 'License: <http://www.opensource.org/licenses/MIT> MIT License'
  end
end
