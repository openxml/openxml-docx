require 'libxml'

module Rocx
  module XmlElements
    class XmlElement
      include LibXML
    
      def add_attributes(node, attributes, namespace=nil)
        attributes.each do |name, value|
          attribute = XML::Attr.new(node, name, value)
          attribute.namespaces.namespace = namespace unless namespace.nil?
        end
      end
    
      def make_element(tag_name, options={})
        content = options[:content] || nil
        namespaces = options[:namespaces] || nil
        node = XML::Node.new(tag_name, content, namespaces)
        attributes = options[:attributes] || nil
        add_attributes(node, attributes, namespaces) unless attributes.nil?
        node
      end
    
    end
  end
end