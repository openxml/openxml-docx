module OpenXml
  module Docx
    module Properties
      class Border < ComplexProperty
        attr_reader :tag

        with_namespace :w do
          attribute :color, expects: :hex_color
          attribute :frame, expects: :boolean
          attribute :shadow, expects: :boolean
          attribute :size, expects: :positive_integer, displays_as: :sz
          attribute :space, expects: :positive_integer
          attribute :theme_color, one_of: OpenXml::Docx::THEME_COLORS
          attribute :theme_shade, expects: :hex_digit
          attribute :theme_tint, expects: :hex_digit
          attribute :type, one_of: OpenXml::Docx::BORDER_TYPES, displays_as: :val
        end

        def initialize(tag=:bdr)
          @tag = tag
        end

      end
    end
  end
end
