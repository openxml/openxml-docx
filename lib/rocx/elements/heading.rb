require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Heading < XmlElement
      include LibXML
    
      def initialize(text, level=1)
        @text = text
        @level = level
        super()
      end

      def to_xml(namespace)
        with_namespace(namespace) do
          node = make_element 'p'
      
          paragraph_properties = make_element 'pPr'
          paragraph_style = make_element 'pStyle', attributes: {'val' => "Heading#{@level}"}
          paragraph_properties << paragraph_style
      
          run = make_element 'r'
          text = make_element 't', content: @text
          run << text
      
          node << paragraph_properties
          node << run
          node
        end
      end
    
    end
  end
end