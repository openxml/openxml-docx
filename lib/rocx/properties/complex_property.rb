module Rocx
  module Properties
    class ComplexProperty < BaseProperty

      def to_xml(xml)
        return unless render?
        xml["w"].public_send(tag, xml_attributes)
      end

      def render?
        !xml_attributes.empty?
      end

    end
  end
end
