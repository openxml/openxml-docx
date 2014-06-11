module Rocx
  module Properties
    class RunStyle < ValueProperty
      tag :rStyle

      def valid?
        !value.nil?
      end

      def invalid_message
        "Invalid #{name}: value must not be nil"
      end

    end
  end
end
