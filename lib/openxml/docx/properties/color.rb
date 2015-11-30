module OpenXml
  module Docx
    module Properties
      class Color < ComplexProperty
        attribute :color, expects: :hex_color, displays_as: :val
        attribute :theme_color, expects: :valid_theme_color
        attribute :theme_shade, expects: :hex_digit
        attribute :theme_tint, expects: :hex_digit

      end
    end
  end
end
