require 'valet/option/common'

module Valet
  module Option
    class Switch < Common
      attr_reader :default, :value

      def initialize(long_name, params = {})
        @default = params[:default] ? true : false
        @value   = @default
        super
      end

      def switch
        @value = ! @value
      end

      def long_name_to_s
        if default
          "--no-#{long_name}".gsub(/_/, '-')
        else
          "--#{long_name}".gsub(/_/, '-')
        end
      end
    end
  end
end
