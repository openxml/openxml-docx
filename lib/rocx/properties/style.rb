module Rocx
  module Properties
    class Style < ValueProperty
      tag :pStyle

      def valid?
        !value.nil?
      end

      def invalid_message
        "Invalid #{name}: value must not be nil"
      end

    end
  end
end
