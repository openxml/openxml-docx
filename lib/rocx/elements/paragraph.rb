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
      end
      
      def to_xml(namespace)
        node = make_element 'p', namespaces: namespace
        
        # AHHHHHHHHHHH
        if @paragraph_text.is_a?(Array)
          text = []
          @paragraph_text.each do |p|
            if p.is_a?(Array)
              text << [make_element('t', content: p[0], namespaces: namespace), p[1]]
            else
              text << [make_element('t', content: p, namespaces: namespace), '']
            end
          end
        else
          text = [[make_element('t', content: @paragraph_text, namespaces: namespace), '']]
        end
        
        pPr = make_element 'pPr', namespaces: namespace
        pStyle = make_element 'pStyle', attributes: {'val' => @style}, namespaces: namespace
        pPr << pStyle
        
        pJc = make_element 'jc', attributes: {'val' => @alignment.to_s}, namespaces: namespace
        pPr << pJc
        node << pPr
        
        text.each do |t|
          run = make_element 'r', namespaces: namespace
          rPr = make_element 'rPr', namespaces: namespace
          
          # apply styles
          rPr << make_element('b', namespaces: namespace) if t[1] =~ /b/
          rPr << make_element('u', attributes: {'val' => 'single'}, namespaces: namespace) if t[1] =~ /u/
          rPr << make_element('i', namespaces: namespace) if t[1] =~ /i/
          
          run << rPr
          
          if @break_before
            last_rendered_page_break = make_element 'lastRenderedPageBreak', namespaces: namespace
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