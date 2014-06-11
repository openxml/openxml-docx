module Rocx
  module Properties
    class FontSize < ValueProperty
      tag :sz

      def valid?
        value.is_a?(Integer) && value >= 0
      end

      def invalid_message
        "Invalid #{name}: must be a positive integer"
      end

    end
  end
end
