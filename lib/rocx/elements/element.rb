require 'libxml'

module Rocx
  module XmlElements
    class XmlElement
      include LibXML
      
      attr_accessor :namespace
      
      def initialize
        self.namespace = nil
      end
      
      def add_attributes(node, attributes, namespace=nil)
        attributes.each do |name, value|
          attribute = XML::Attr.new(node, name, value)
          attribute.namespaces.namespace = namespace unless namespace.nil?
        end
      end
      
      def make_element(tag_name, options={})
        content = options[:content] || nil
        node = XML::Node.new(tag_name, content, self.namespace)
        attributes = options[:attributes] || nil
        add_attributes(node, attributes, self.namespace) unless attributes.nil?
        node
      end
      
      def with_namespace(namespace)
        _ns = self.namespace
        self.namespace = namespace
        begin
          yield
        ensure
          self.namespace = _ns
        end
      end
    end
  end
end