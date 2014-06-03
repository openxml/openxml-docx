module Rocx
  module Properties
    class Shading
      include AttributeBuilder

      VALID_SHADING_PATTERNS = %i(clear
                                  diagCross
                                  diagStripe
                                  horzCross
                                  horzStripe
                                  nil
                                  pct10
                                  pct12
                                  pct15
                                  pct20
                                  pct25
                                  pct30
                                  pct35
                                  pct37
                                  pct45
                                  pct5
                                  pct50
                                  pct55
                                  pct60
                                  pct62
                                  pct65
                                  pct70
                                  pct75
                                  pct80
                                  pct85
                                  pct87
                                  pct90
                                  pct95
                                  reverseDiagStripe
                                  solid
                                  thinDiagCross
                                  thinDiagStripe
                                  thinHorzCross
                                  thinHorzStripe
                                  thinReverseDiagStripe
                                  thinVertStripe
                                  vertStripe)

      attribute :color, expects: :hex_color
      attribute :fill, expects: :hex_color
      attribute :theme_color, expects: :valid_theme_color, displays_as: :themeColor
      attribute :theme_fill, expects: :valid_theme_color, displays_as: :themeFill
      attribute :theme_fill_shade, expects: :hex_digit, displays_as: :themeFillShade
      attribute :theme_fill_tint, expects: :hex_digit, displays_as: :themeFillTint
      attribute :theme_shade, expects: :hex_digit, displays_as: :themeShade
      attribute :theme_tint, expects: :hex_digit, displays_as: :themeTint
      attribute :pattern, expects: :shading_pattern, displays_as: :val

      def name
        "shading"
      end

      def tag
        :shd
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def shading_pattern(value)
        valid_in? value, VALID_SHADING_PATTERNS
      end

    end
  end
end
