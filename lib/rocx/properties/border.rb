module Rocx
  module Properties
    class Border
      include AttributeBuilder

      attr_reader :tag

      attribute :color, expects: :hex_color
      attribute :frame, expects: :true_or_false
      attribute :shadow, expects: :true_or_false
      attribute :size, expects: :positive_integer, displays_as: :sz
      attribute :space, expects: :positive_integer
      attribute :theme_color, expects: :valid_theme_color, displays_as: :themeColor
      attribute :theme_shade, expects: :hex_digit, displays_as: :themeShade
      attribute :theme_tint, expects: :hex_digit, displays_as: :themeTint
      attribute :type, expects: :valid_type, displays_as: :val

      def initialize(tag)
        @tag = tag
      end

      def name
        "border"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, xml_attributes)
      end

    end
  end
end
