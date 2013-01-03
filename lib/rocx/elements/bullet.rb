require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Bullet < XmlElement
      include LibXML
      
      def initialize(text)
        @bullet_text = text
        super()
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          node = make_element 'p'
        
          properties = make_element 'pPr'
          style = make_element 'pStyle', attributes: {'val' => 'ListBullet'}
          properties << style
        
          num_properties = make_element 'numPr'
          # ilvl = indent level
          ilvl = make_element 'ilvl', attributes: {'val' => "0"}
          # numId = bullet type (bullet, oval, square, etc.)
          # 2 -> standard bullet
          # 3 -> number list
          num_id = make_element 'numId', attributes: {'val' => "2"}
        
          num_properties << ilvl
          num_properties << num_id
          properties << num_properties
        
          run = make_element 'r'
          text = make_element 't', content: @bullet_text
          run << text
        
          node << properties
          node << run
          node
        end
      end
      
    end
  end
end