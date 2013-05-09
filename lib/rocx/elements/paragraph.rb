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
          node = make_element 'p'
        
          # !Todo: This needs a better API
          if @paragraph_text.is_a?(Array)
            text = []
            @paragraph_text.each do |p|
              if p.is_a?(Array)
                content = p.shift
                text << [make_element('t', content: content, attributes: {'xml:space' => 'preserve'}, attribute_namespace: :none), p]
              else
                text << [make_element('t', content: p, attributes: {'xml:space' => 'preserve'}, attribute_namespace: :none), []]
              end
            end
          else
            text = [[make_element('t', content: @paragraph_text), []]]
          end
          
          paragraph_properties = make_element 'pPr'
          paragraph_style = make_element 'pStyle', attributes: {'val' => @style}
          paragraph_properties << paragraph_style
          
          paragraph_justification = make_element 'jc', attributes: {'val' => @alignment.to_s}
          paragraph_properties << paragraph_justification
          node << paragraph_properties
          
          text.each_with_index do |t, i|
            run = make_element 'r'
            run_properties = make_element 'rPr'
            
            content = t.shift
            # apply styles
            run_properties << make_element('b') if t[0].member?(:bold)
            run_properties << make_element('u', attributes: {'val' => 'single'}) if t[0].member?(:underline)
            run_properties << make_element('i') if t[0].member?(:italic)
            run_properties << make_element('vertAlign', attributes: {'val' => 'superscript'}) if t[0].member?(:super)
            run_properties << make_element('vertAlign', attributes: {'val' => 'subscript'}) if t[0].member?(:sub)
            
            run << run_properties
            
            run << content
            node << run
          end
          node
        end
      end
      
    end
  end
end