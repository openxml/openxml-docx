module OpenXml
  module Docx
    module Properties
      class Shading < ComplexProperty
        tag :shd

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
        attribute :theme_color, expects: :valid_theme_color
        attribute :theme_fill, expects: :valid_theme_color
        attribute :theme_fill_shade, expects: :hex_digit
        attribute :theme_fill_tint, expects: :hex_digit
        attribute :theme_shade, expects: :hex_digit
        attribute :theme_tint, expects: :hex_digit
        attribute :pattern, expects: :shading_pattern, displays_as: :val

      private

        def shading_pattern(value)
          valid_in? value, VALID_SHADING_PATTERNS
        end

      end
    end
  end
end
