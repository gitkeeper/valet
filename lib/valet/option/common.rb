module Valet
  module Option
    class Common
      attr_reader :long_name
      attr_accessor :short_name, :description

      def initialize(long_name, params = {})
        @long_name   = long_name
        @short_name  = params[:short]
        @description = params[:desc]
      end

      alias_method :name, :long_name

      def switch?
        instance_of?(Switch)
      end

      def flag?
        instance_of?(Flag)
      end

      def short_name_to_s
        "-#{short_name}" if short_name
      end
    end
  end
end
