module OpenXml
  module Docx
    module Elements
      class Container < Element
        include PropertyBuilder

        attr_reader :children

        def initialize(options={})
          @children = []
          super
        end

        def <<(child)
          children << child
          self
        end
        alias :push :<<

        def concat(new_children)
          Array(new_children).each { |child| self.push child }
          self
        end

        def to_xml(xml)
          xml[namespace].public_send(tag, xml_attributes) {
            property_xml(xml)
            children.each { |child| child.to_xml(xml) }
          }
        end

        def method_missing(method, *args, &block)
          found_child = children.select { |child| child.name == method.to_s }
          return if found_child.empty?
          return found_child.first if found_child.count == 1
          found_child
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
