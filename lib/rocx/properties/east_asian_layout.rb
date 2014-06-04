module Rocx
  module Properties
    class EastAsianLayout
      include AttributeBuilder

      VALID_BRACKETS = %i(angle curly none round square)

      attribute :combine, expects: :on_or_off
      attribute :combine_brackets, expects: :valid_bracket, displays_as: :combineBrackets
      attribute :id, expects: :integer
      attribute :vertical, expects: :on_or_off, displays_as: :vert
      attribute :vertical_compress, expects: :on_or_off, displays_as: :vertCompress

      def name
        "east_asian_layout"
      end

      def tag
        :eastAsianLayout
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def valid_bracket(value)
        valid_in? value, VALID_BRACKETS
      end

    end
  end
end
