module Rocx
  module Properties
    class Style < BaseProperty

      def valid?
        !value.nil?
      end

      def tag
        :pStyle
      end

      def invalid_message
        "Invalid #{name}: value must not be nil"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
