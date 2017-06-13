module OpenXml
  module Docx
    module Properties
      class TableCellBorder < ComplexProperty
        tag_is_one_of %i(top start bottom end insideH insideV tl2br tr2bl left right)

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :frame, expects: :boolean
          attribute :shadow, expects: :boolean
          attribute :space, expects: :positive_integer
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
          attribute :value, one_of: OpenXml::Docx::BORDER_TYPES, displays_as: :val
          attribute :width, expects: :positive_integer, displays_as: :sz
        end

        def initialize(tag, value)
          super tag
          self.value = value
        end

      end
    end
  end
end
