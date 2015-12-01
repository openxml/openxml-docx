module OpenXml
  module Docx
    module Properties
      class TableBorder < ComplexProperty
        attr_accessor :tag

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
          @tag = tag
          @value = value
          raise ArgumentError, invalid_message unless valid_tag? tag
        end

      private

        def valid_tag?(value)
          ok_tags.include? value
        end

        def invalid_message
          "Invalid value for #{name}; acceptable values are #{ok_tags.join(", ")} (provided: #{tag.inspect})"
        end

        def ok_tags
          %i(top start bottom end insideH insideV)
        end

      end
    end
  end
end
