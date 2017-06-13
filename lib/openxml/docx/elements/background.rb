module OpenXml
  module Docx
    module Elements
      class Background < OpenXml::Docx::Element
        include HasChildren, HasProperties

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS, displays_as: :themeColor
          attribute :theme_shade, expects: :hex_digit, displays_as: :themeShade
          attribute :theme_tint, expects: :hex_digit, displays_as: :themeTint
        end

      end
    end
  end
end
