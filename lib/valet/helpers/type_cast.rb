module Valet
  module Helpers
    module TypeCast
      ALLOWED_TYPES = [String, Integer, Float, Array, Hash, Time]

      def string_to(type, string)
        validate_type(type)

        case
        when type == Integer then string.to_i
        when type == Float then string.to_f
        when type == Array then to_array(string)
        when type == Hash then to_hash(string)
        when type == Time then Time.parse(string)
        else type.new(string)
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
        string.split(/,|\s/).inject(Hash.new) do |hash, str|
          key, value = str.split(/:/)
          hash[key.to_sym] = value
          hash
        end
      end
    end
  end
end
