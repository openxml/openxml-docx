module OpenXml
  module Docx
    module Properties
      class TableCellBorder < ComplexProperty
        tag_is_one_of %i(top start bottom end insideH insideV tl2br tr2bl)

        attribute :color, expects: :hex_color
        attribute :frame, expects: :true_or_false
        attribute :shadow, expects: :true_or_false
        attribute :space, expects: :positive_integer
        attribute :theme_color, expects: :valid_theme_color
        attribute :theme_shade, expects: :hex_digit
        attribute :theme_tint, expects: :hex_digit
        attribute :value, expects: :valid_type, displays_as: :val
        attribute :width, expects: :positive_integer, displays_as: :sz

        def initialize(tag, value)
          super tag
          self.value = value
        end

      end
    end
  end
end
