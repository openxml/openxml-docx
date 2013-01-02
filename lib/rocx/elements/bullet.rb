require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Bullet < XmlElement
      include LibXML
      
      def initialize(text)
        @bullet_text = text
      end
      
      def to_xml(namespace)
        node = make_element 'p', namespaces: namespace
        
        properties = make_element 'pPr', namespaces: namespace
        style = make_element 'pStyle', attributes: {'val' => 'ListBullet'}, namespaces: namespace
        properties << style
        
        num_properties = make_element 'numPr', namespaces: namespace
        # ilvl = indent level
        ilvl = make_element 'ilvl', attributes: {'val' => "0"}, namespaces: namespace
        # numId = bullet type (bullet, oval, square, etc.)
        # 2 -> standard bullet
        # 3 -> number list
        num_id = make_element 'numId', attributes: {'val' => "2"}, namespaces: namespace
        
        num_properties << ilvl
        num_properties << num_id
        properties << num_properties
        
        run = make_element 'r', namespaces: namespace
        text = make_element 't', content: @bullet_text, namespaces: namespace
        run << text
        
        node << properties
        node << run
        node
      end
      
    end
  end
end