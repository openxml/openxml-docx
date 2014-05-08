module Rocx
  module Elements
    class Paragraph
      attr_reader :runs, :properties

      def initialize(properties={})
        @properties = properties
        @runs = []
      end

      def [](reference)
        properties[reference]
      end

      def []=(reference, value)
        properties[reference] = value
      end

      def <<(run)
        runs << run
      end

      def to_xml(xml)
        xml["w"].p {
          property_xml(xml) if properties.length > 0
          runs.each { |run| run.to_xml(xml) }
        }
      end

    private

      def property_xml(xml)
        xml["w"].pPr {
          properties.each do |property, value|
            xml.send(property, value)
          end
        }
      end

    end
  end
end
