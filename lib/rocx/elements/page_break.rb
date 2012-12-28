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
        pg_break = make_element 'p', namespaces: namespace
        
        case @type
        when :page
          run = make_element 'r', namespaces: namespace
          br = make_element 'br', attributes: {'type' => @type.to_s}, namespaces: namespace
          
          run << br
          pg_break << run
        
        when :section
          pPr = make_element 'pPr', namespaces: namespace
          sectPr = make_element 'sectPr', namespaces: namespace

          attributes = {'w' => '12240', 'h' => '15840'}
          attributes['orient'] = 'landscape' if orientation == :landscape
          pgSz = make_element 'pgSz', attributes: attributes, namespaces: namespace
          
          sectPr << pgSz
          pPr << sectPr
          pg_break << pPr
        end
      end
      
    end
  end
end