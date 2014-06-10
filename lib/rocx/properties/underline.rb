module Rocx
  module Properties
    class Underline
      include AttributeBuilder

      VALID_UNDERLINE_TYPES = %i(dash dashDotDotHeavy dashDotHeavy dashedHeavy dashLong dashLongHeavy dotDash dotDotDash dotted dottedHeavy double none single thick wave wavyDouble wavyHeavy words)

      attribute :color, expects: :hex_color
      attribute :theme_color, expects: :valid_theme_color
      attribute :theme_shade, expects: :hex_digit
      attribute :theme_tint, expects: :hex_digit
      attribute :type, expects: :valid_underline_type, displays_as: :val

      def name
        "underline"
      end

      def tag
        :u
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def valid_underline_type(value)
        valid_in? value, VALID_UNDERLINE_TYPES
      end

    end
  end
end
