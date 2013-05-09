require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class PageBreak < XmlElement
      include LibXML
      
      def initialize(options={})
        @type = options[:type] || :page
        @orientation = options[:orientation] || :portrait
        check_type!
      end
      
      def check_type!
        valid_types = [:page, :section]
        raise ArgumentError.new("Valid page break types are :page and :section, not #{@type.inspect}") unless valid_types.member?(@type)
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          page_break = make_element 'p'
          
          case @type
          when :page
            run = make_element 'r'
            br = make_element 'br', attributes: {'type' => @type.to_s}
            
            run << br
            page_break << run
          when :section
            paragraph_properties = make_element 'pPr'
            section_properties = make_element 'sectPr'
            
            attributes = {'w' => '12240', 'h' => '15840'}
            attributes['orient'] = 'landscape' if orientation == :landscape
            page_size = make_element 'pgSz', attributes: attributes
            
            section_properties << page_size
            paragraph_properties << section_properties
            page_break << paragraph_properties
          end
          page_break
        end
      end
      
    end
  end
end