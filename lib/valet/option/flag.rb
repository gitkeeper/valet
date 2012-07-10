require 'valet/option/common'

module Valet
  module Option
    class Flag < Common
      attr_reader :type, :default
      attr_accessor :value

      def initialize(name, params = {})
        @type    = params[:type] || String
        @default = params[:default]
        @value   = @default
        super
      end

      private

      def long_name_to_s
        default ? "--#{long_name}[=#{arg_to_s}]" : "--#{long_name}=#{arg_to_s}"
      end

      def arg_to_s
        long_name.to_s.upcase.gsub(/_/, ' ')
      end
    end
  end
end
