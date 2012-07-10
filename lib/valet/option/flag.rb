require 'valet/option/common'

module Valet
  module Option
    class Flag < Common
      attr_reader :type, :default
      attr_accessor :value, :argument

      def initialize(long_name, params = {})
        @type     = params[:type] || String
        @argument = params[:arg] || long_name.to_s.upcase.gsub(/_/, ' ')
        @default  = params[:default]
        @value    = @default
        super
      end

      def long_name_to_s
        if default
          "--#{long_name}[=#{argument}]".gsub(/_/, '-')
        else
          "--#{long_name}=#{argument}".gsub(/_/, '-')
        end
      end
    end
  end
end
