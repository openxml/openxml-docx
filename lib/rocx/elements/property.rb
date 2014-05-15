module Rocx
  module Elements
    class Property
      attr_reader :properties, :children

      def initialize(properties={})
        @properties = properties
        @children = []
      end

      def <<(child)
        children << child
      end

      def [](reference)
        properties[reference]
      end

      def []=(reference, value)
        properties[reference] = value
      end

      def to_xml(xml)
        xml["w"].public_send(tag) {
          property_xml(xml)
          children.each { |child| child.to_xml(xml) }
        }
      end

    protected

      def property_xml(xml)
        return unless properties.length > 0
        xml["w"].public_send(property_tag) {
          properties.each do |property, value|
            xml.send(property, value)
          end
        }
      end

    private

      def tag
        raise NotImplementedError
      end

      def property_tag
        raise NotImplementedError
      end

    end
  end
end
