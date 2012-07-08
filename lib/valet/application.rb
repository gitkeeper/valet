module Valet
  class Application
    class << self
      attr_accessor :name, :version, :authors, :copyright, :license

      def start(args = ARGV)
        new(args)
      end
    end

    attr_reader :args

    def initialize(args)
      @args = args
      render_version
    end

    def render_version
      puts Views::Version.new(self.class).render.strip
    end
  end
end
