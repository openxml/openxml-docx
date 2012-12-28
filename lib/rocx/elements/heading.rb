require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Heading < XmlElement
      include LibXML
    
      def initialize(text, level=1)
        @text = text
        @level = level
      end

      def to_xml(namespace)
        node = make_element 'p', namespaces: namespace
      
        pPr = make_element 'pPr', namespaces: namespace
        pStyle = make_element 'pStyle', attributes: {'val' => "Heading#{@level}"}, namespaces: namespace
        pPr << pStyle
      
        run = make_element 'r', namespaces: namespace
        text = make_element 't', content: @text, namespaces: namespace
        run << text
      
        node << pPr
        node << run
      end
    
    end
  end
end