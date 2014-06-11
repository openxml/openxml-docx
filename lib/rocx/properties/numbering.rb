module Rocx
  module Properties
    class Numbering < BaseProperty
      include AttributeBuilder

      tag :numPr

      attribute :level, expects: :positive_integer, displays_as: :ilvl
      attribute :id, expects: :positive_integer, displays_as: :numId

      def initialize
      end

      def to_xml(xml)
        return if xml_attributes.empty?
        xml["w"].public_send(tag) {
          xml_attributes.each do |tag_name, value|
            xml.public_send(tag_name, "w:val" => value)
          end
        }
      end

    end
  end
end
