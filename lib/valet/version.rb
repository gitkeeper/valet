module Valet
  module VERSION
    MAJOR = 0
    MINOR = 0
    BUILD = 1
    PRE   = nil

    STRING = [MAJOR, MINOR, BUILD, PRE].compact.join('.')
  end
end
