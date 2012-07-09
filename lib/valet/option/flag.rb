module Valet
  module Option
    class Flag < Option::Common
      def flag?
        true
      end
    end
  end
end
