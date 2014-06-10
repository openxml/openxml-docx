module Rocx
  module Properties
    class FontSize < BaseProperty

      def valid?
        value.is_a?(Integer) && value >= 0
      end

      def invalid_message
        "Invalid #{name}: must be a positive integer"
      end

      def tag
        :sz
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
