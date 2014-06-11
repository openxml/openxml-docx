module Rocx
  module Properties
    class PositiveIntegerProperty < IntegerProperty

      def valid?
        super && value >= 0
      end

      def invalid_message
        "Invalid #{name}: must be a positive integer"
      end

    end
  end
end
