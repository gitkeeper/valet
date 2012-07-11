module Valet
  class Application
    attr_reader :arguments, :options, :commands, :examples
    attr_accessor :name, :version, :authors, :email, :homepage
    attr_accessor :copyright, :license, :summary, :description

    def initialize(arguments = ARGV)
      @arguments = arguments
      @options   = Options.new
      @commands  = Commands.new
      @examples  = []
    end
  end
end
