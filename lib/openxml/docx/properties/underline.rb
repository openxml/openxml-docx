module OpenXml
  module Docx
    module Properties
      class Underline < ComplexProperty
        tag :u

        VALID_UNDERLINE_TYPES = %i(dash dashDotDotHeavy dashDotHeavy dashedHeavy dashLong dashLongHeavy dotDash dotDotDash dotted dottedHeavy double none single thick wave wavyDouble wavyHeavy words)

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :theme_color, expects: :valid_theme_color
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
          attribute :type, expects: :valid_underline_type, displays_as: :val
        end

      private

        def valid_underline_type(value)
          valid_in? value, VALID_UNDERLINE_TYPES
        end

      end
    end
  end
end
