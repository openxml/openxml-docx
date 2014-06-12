module Rocx
  module Elements
    class Break < Element
      tag :br

      attribute :clear, expects: :valid_clear
      attribute :type, expects: :valid_break_type

      VALID_CLEARS = %i(all left none right)
      VALID_BREAK_TYPES = %i(column page textWrapping)

      def to_xml(xml)
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def valid_clear(value)
        valid_in? value, VALID_CLEARS
      end

      def valid_break_type(value)
        valid_in? value, VALID_BREAK_TYPES
      end

    end
  end
end
