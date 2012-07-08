module Valet
  module Views
    class Version < View
      def initialize(application)
        @app = application
      end

      def name
        @app.name
      end

      def version
        @app.version
      end

      def copyright
        @app.copyright
      end

      def license
        @app.license
      end

      def authors
        if @app.authors.respond_to?(:join) && @app.authors.count > 0
          "Written by #{@app.authors.join(', ')}"
        end
      end
    end
  end
end
