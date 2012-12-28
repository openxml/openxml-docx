require 'libxml'

module Rocx
  module XmlElements
    class XmlElement
      include LibXML
    
      def add_attributes(node, attributes)
        attributes.each do |name, value|
          XML::Attr.new(node, name, value)
        end
      end
    
      def make_element(tag_name, options={})
        content = options[:content] || nil
        namespaces = options[:namespaces] || nil
        node = XML::Node.new(tag_name, content, namespaces)
        attributes = options[:attributes] || nil
        add_attributes(node, attributes) unless attributes.nil?
        node
      end
    
    end
  end
end