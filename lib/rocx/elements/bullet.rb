require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Bullet < XmlElement
      include LibXML
      
      def initialize(text, options={})
        @bullet_text = text
        @style = options[:style] || 2
        @level = options[:level] || 0
        super()
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          node = make_element 'p'
          
          properties = make_element 'pPr'
          style = make_element 'pStyle', attributes: {'val' => 'ListBullet'}
          properties << style
          
          num_properties = make_element 'numPr'
          indent_level = make_element 'ilvl', attributes: {'val' => "#{@level}"}
          bullet_type = make_element 'numId', attributes: {'val' => "#{@style}"} # (standard bullet = 2, number = 3)
          num_properties << indent_level
          num_properties << bullet_type
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