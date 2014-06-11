module Rocx
  module Properties
    class Border < ComplexProperty
      include AttributeBuilder

      attr_reader :tag

      attribute :color, expects: :hex_color
      attribute :frame, expects: :true_or_false
      attribute :shadow, expects: :true_or_false
      attribute :size, expects: :positive_integer, displays_as: :sz
      attribute :space, expects: :positive_integer
      attribute :theme_color, expects: :valid_theme_color
      attribute :theme_shade, expects: :hex_digit
      attribute :theme_tint, expects: :hex_digit
      attribute :type, expects: :valid_type, displays_as: :val

      def initialize(tag=:bdr)
        @tag = tag
      end

      name "border"

    end
  end
end
