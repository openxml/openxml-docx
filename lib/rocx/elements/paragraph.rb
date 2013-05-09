require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Paragraph < XmlElement
      include LibXML
      
      def initialize(text, options={})
        @paragraph_text = text
        @style = options[:style] || 'BodyText'
        @alignment = options[:alignment] || :left
        super()
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          @node = make_element 'p'
          text = build_text
          build_properties
          text.each{ |t| @node << t.build(namespace) }
          @node
        end
        
      end
      
      class TextNode < XmlElement
        
        attr_accessor :elem, :styles
        
        def initialize(elem, styles=[])
          @elem = elem
          @styles = styles
        end
        
        def bold?
          styles.member?(:bold)
        end
        
        def underline?
          styles.member?(:underline)
        end
        
        def italic?
          styles.member?(:italic)
        end
        
        def super?
          styles.member?(:super)
        end
        
        def sub?
          styles.member?(:sub)
        end
        
        def build(namespace)
          with_namespace(namespace) do
            @run = make_element 'r'
            build_properties
            @run << elem
            @run
          end
        end
        
        def build_properties
          run_properties = make_element 'rPr'
          run_properties << make_element('b') if bold?
          run_properties << make_element('u', attributes: {'val' => 'single'}) if underline?
          run_properties << make_element('i') if italic?
          run_properties << make_element('vertAlign', attributes: {'val' => 'superscript'}) if super?
          run_properties << make_element('vertAlign', attributes: {'val' => 'subscript'}) if sub?
          @run << run_properties
        end
        
      end
      
    private
    
      def build_text
        return [TextNode.new(make_element('t', content: @paragraph_text))] unless @paragraph_text.is_a?(Array)
        
        @paragraph_text.each_with_object([]) do |p, text|
          content, *p = p
          text << TextNode.new(make_element('t', content: content, attributes: {'xml:space' => 'preserve'}, attribute_namespace: :none), p)
        end
      end
      
      def build_properties
        paragraph_properties = make_element 'pPr'
        paragraph_style = make_element 'pStyle', attributes: {'val' => @style}
        paragraph_properties << paragraph_style
        paragraph_justification = make_element 'jc', attributes: {'val' => @alignment.to_s}
        paragraph_properties << paragraph_justification
        @node << paragraph_properties
      end
      
    end
  end
end