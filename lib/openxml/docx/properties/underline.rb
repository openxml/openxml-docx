module OpenXml
  module Docx
    module Properties
      class Underline < ComplexProperty
        tag :u

        VALID_UNDERLINE_TYPES =

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
          attribute :type, displays_as: :val, one_of: %i(dash dashDotDotHeavy
                                                        dashDotHeavy dashedHeavy
                                                        dashLong dashLongHeavy
                                                        dotDash dotDotDash
                                                        dotted dottedHeavy double
                                                        none single thick wave
                                                        wavyDouble wavyHeavy words)
        end
      end
    end
  end
end
