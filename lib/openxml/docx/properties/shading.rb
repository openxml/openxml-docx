module OpenXml
  module Docx
    module Properties
      class Shading < ComplexProperty
        tag :shd

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :fill, expects: :hex_color
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_fill, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_fill_shade, expects: :hex_digit
          attribute :theme_fill_tint, expects: :hex_digit
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
          attribute :pattern, displays_as: :val, one_of: %i(clear
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
        end

      end
    end
  end
end
