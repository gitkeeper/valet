require 'valet/option/common'
require 'valet/helpers/type_converter'

module Valet
  module Option
    class Flag < Common
      attr_reader :default, :value
      attr_writer :arg_name, :converter

      def converter
        @converter ||= Helpers::StringConverter.new
      end

      def type
        converter.target_type
      end

      def type=(new_target_type)
        converter.target_type = new_target_type
      end

      def default=(new_default)
        self.value = @default = new_default
      end

      def value=(new_value)
        @value = converter.convert(new_value)
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
