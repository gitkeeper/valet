module Valet
  module Option
    class Common
      attr_reader :long_name, :short_name
      attr_accessor :summary, :description

      alias_method :name, :long_name

      def initialize(long_name)
        validate_long_name(long_name)
        @long_name = long_name
      end

      def short_name=(new_short_name)
        validate_short_name(new_short_name)
        @short_name = new_short_name
      end

      def switch?
        instance_of?(Switch)
      end

      def flag?
        instance_of?(Flag)
      end

      def short_name_to_s
        "-#{short_name}" if short_name
      end

      private

      def validate_long_name(long_name)
        unless valid_long_name?(long_name)
          raise OptionError,
            "Long Name: '#{long_name}' must be a symbol and longer than one character"
        end
      end

      def valid_long_name?(long_name)
        long_name.is_a?(Symbol) && long_name.length > 1
      end

      def validate_short_name(short_name)
        unless valid_short_name?(short_name)
          raise OptionError,
            "Short Name: '#{short_name}' must be a symbol and exactly one character long"
        end
      end

      def valid_short_name?(short_name)
        short_name.is_a?(Symbol) && short_name.length == 1
      end
    end
  end

  class OptionError < StandardError; end
end
