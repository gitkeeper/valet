module Valet
  class Application
    def self.define
      application = Application.new
      yield(application) if block_given?
      application
    end

    attr_reader :arguments, :options, :commands, :examples
    attr_accessor :name, :version, :authors, :email, :homepage
    attr_accessor :copyright, :license, :summary, :description

    def initialize
      @options = Options.new
      @commands = Commands.new
      @examples = []

      yield(self) if block_given?
    end
  end
end
