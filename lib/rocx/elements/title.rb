require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Title < XmlElement
      include LibXML
    
      def initialize(text)
        @text = text
      end

      def to_xml(namespace)
        with_namespace(namespace) do
          node = make_element 'p'
      
          pPr = make_element 'pPr'
          pStyle = make_element 'pStyle', attributes: {'val' => "Title"}
          pPr << pStyle
      
          run = make_element 'r'
          text = make_element 't', content: @text
          run << text
      
          node << pPr
          node << run
          node
        end
      end
    
    end
  end
end