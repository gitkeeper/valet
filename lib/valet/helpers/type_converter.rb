module Valet
  module Helpers
    class StringConverter
      ALLOWED_TYPES = [String, Integer, Float, Array, Hash, Time]

      attr_reader :target_type

      def target_type=(new_target_type)
        validate_type(new_target_type)
        @target_type = new_target_type
      end

      def convert(string)
        case
        when target_type == Integer then string.to_i
        when target_type == Float then string.to_f
        when target_type == Array then to_array(string)
        when target_type == Hash then to_hash(string)
        when target_type == Time then Time.parse(string)
        else string
        end
      end

      private

      def validate_type(type)
        unless valid_type?(type)
          raise TypeError,
            "'#{type}' must be one of #{ALLOWED_TYPES.join(', ')}"
        end
      end

      def valid_type?(type)
        ALLOWED_TYPES.include?(type)
      end

      def to_array(string)
        string.split(/,|\s/)
      end

      def to_hash(string)
        to_array(string).inject(Hash.new) do |hash, str|
          key, value = str.split(/:/)
          hash[key.to_sym] = value
          hash
        end
      end
    end
  end
end
