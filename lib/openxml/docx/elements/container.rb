module OpenXml
  module Docx
    module Elements
      class Container < Element
        include PropertyBuilder

        attr_reader :children

        def initialize
          @children = []
        end

        def <<(child)
          children << child
        end

        def to_xml(xml)
          xml[namespace].public_send(tag, xml_attributes) {
            property_xml(xml)
            children.each { |child| child.to_xml(xml) }
          }
        end

      private

        def properties_tag
          self.class.properties_tag || default_properties_tag
        end

        def default_properties_tag
          :"#{tag}Pr"
        end

      end
    end
  end
end
