require 'valet/option/common'

module Valet
  module Option
    class Switch < Common
      attr_reader :default, :value

      def initialize(name, params = {})
        @default = params[:default] ? true : false
        @value   = @default
        super
      end

      def switch
        @value = ! @value
      end

      private

      def long_name_to_s
        default ? "--no-#{long_name}" : "--#{long_name}"
      end
    end
  end
end
