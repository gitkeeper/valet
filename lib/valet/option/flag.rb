require 'valet/option/common'
require 'valet/helpers/type_cast'

module Valet
  module Option
    class Flag < Common
      include Helpers::TypeCast

      attr_reader :type, :default, :value
      attr_writer :arg_name

      def initialize(long_name)
        super
        @type = String
      end

      def type=(new_type)
        validate_type(new_type)
        @type = new_type
      end

      def default=(new_default)
        @default = new_default
        @value = @default
      end

      def value=(new_value)
        @value = string_to(type, new_value)
      end

      def arg_name
        @arg_name or long_name.to_s.gsub(/_/, ' ')
      end

      def long_name_to_s
        if default
          "--#{long_name}[=<#{arg_name}>]".gsub(/_/, '-')
        else
          "--#{long_name}=<#{arg_name}>".gsub(/_/, '-')
        end
      end
    end
  end
end
