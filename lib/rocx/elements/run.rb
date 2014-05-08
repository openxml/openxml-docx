module Rocx
  module Elements
    class Run
      attr_reader :text, :properties

      def initialize(text)
        @text = text
        @properties = []
      end

      def to_xml(xml)
        xml["w"].r {
          property_xml(xml) if properties.length > 0
          xml["w"].t text
        }
      end

    private

      def property_xml(xml)
        xml["w"].rPr {
          properties.each do |property, value|
            xml.send(property, value)
          end
        }
      end

    end
  end
end
