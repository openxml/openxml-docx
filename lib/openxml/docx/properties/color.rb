module OpenXml
  module Docx
    module Properties
      class Color < ComplexProperty
        with_namespace :w do
          attribute :color, expects: :hex_color, displays_as: :val
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
        end

      end
    end
  end
end
