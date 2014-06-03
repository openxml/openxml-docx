module Rocx
  module Properties
    class Color
      include AttributeBuilder

      attribute :color, expects: :hex_color, displays_as: :val
      attribute :theme_color, expects: :valid_theme_color, displays_as: :themeColor
      attribute :theme_shade, expects: :hex_digit, displays_as: :themeShade
      attribute :theme_tint, expects: :hex_digit, displays_as: :themeTint

      def name
        "color"
      end

      def tag
        :color
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    end
  end
end
