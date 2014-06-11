module Rocx
  module Properties
    class Border < BaseProperty
      include AttributeBuilder

      attr_reader :tag

      attribute :color, expects: :hex_color
      attribute :frame, expects: :true_or_false
      attribute :shadow, expects: :true_or_false
      attribute :size, expects: :positive_integer, displays_as: :sz
      attribute :space, expects: :positive_integer
      attribute :theme_color, expects: :valid_theme_color
      attribute :theme_shade, expects: :hex_digit
      attribute :theme_tint, expects: :hex_digit
      attribute :type, expects: :valid_type, displays_as: :val

      def initialize(tag=:bdr)
        @tag = tag
      end

      name "border"

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    end
  end
end
