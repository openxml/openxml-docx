module Rocx
  module Properties
    class StyleName < ValueProperty
      tag :name

      def valid?
        value.is_a?(String) && !value.length.zero?
      end

      def invalid_message
        "#{name} must be a non-empty string"
      end

    end
  end
end
