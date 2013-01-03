require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Paragraph < XmlElement
      include LibXML
      
      def initialize(text, options={})
        @paragraph_text = text
        @style = options[:style] || 'BodyText'
        @break_before = options[:break_before] || false
        @alignment = options[:alignment] || :left
        super()
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          node = make_element 'p'
        
          # AHHHHHHHHHHH
          if @paragraph_text.is_a?(Array)
            text = []
            @paragraph_text.each do |p|
              if p.is_a?(Array)
                text << [make_element('t', content: p[0]), p[1]]
              else
                text << [make_element('t', content: p), '']
              end
            end
          else
            text = [[make_element('t', content: @paragraph_text), '']]
          end
        
          pPr = make_element 'pPr'
          pStyle = make_element 'pStyle', attributes: {'val' => @style}
          pPr << pStyle
        
          pJc = make_element 'jc', attributes: {'val' => @alignment.to_s}
          pPr << pJc
          node << pPr
        
          text.each do |t|
            run = make_element 'r'
            rPr = make_element 'rPr'
          
            # apply styles
            rPr << make_element('b') if t[1] =~ /b/
            rPr << make_element('u', attributes: {'val' => 'single'}) if t[1] =~ /u/
            rPr << make_element('i') if t[1] =~ /i/
          
            run << rPr
          
            if @break_before
              last_rendered_page_break = make_element 'lastRenderedPageBreak'
              run << last_rendered_page_break
            end
          
            run << t[0]
            node << run
          end
          node
        end
      end
      
    end
  end
end