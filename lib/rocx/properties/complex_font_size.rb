module Rocx
  module Properties
    class ComplexFontSize < BaseProperty      
      tag :szCs

      def valid?
        value.is_a?(Integer) && value >= 0
      end

      def invalid_message
        "Invalid #{name}: must be a positive integer"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
