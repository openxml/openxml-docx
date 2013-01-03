require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class PageBreak < XmlElement
      include LibXML
      
      def initialize(options={})
        @type = options[:type] || :page
        @orientation = options[:orientation] || :portrait
        valid_types = [:page, :section]
        
        raise ArgumentError.new("Valid page break types are :page and :section, not #{@type.inspect}") unless valid_types.member?(@type)
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          pg_break = make_element 'p'
      
          case @type
          when :page
            run = make_element 'r'
            br = make_element 'br', attributes: {'type' => @type.to_s}
        
            run << br
            pg_break << run
      
          when :section
            pPr = make_element 'pPr'
            sectPr = make_element 'sectPr'

            attributes = {'w' => '12240', 'h' => '15840'}
            attributes['orient'] = 'landscape' if orientation == :landscape
            pgSz = make_element 'pgSz', attributes: attributes
        
            sectPr << pgSz
            pPr << sectPr
            pg_break << pPr
          end
          pg_break
        end
      end
      
    end
  end
end