require 'libxml'
require 'rocx/elements/element'

module Rocx
  module XmlElements
    class Table < XmlElement
      include LibXML
      
      def initialize(contents, options={})
        @width = options[:width] || 100
        @width_unit = options[:width_unit] || :pct
        @column_count = contents[0].length
        @column_width = @width / @column_count # ?
        @contents = contents
      end
      
      def to_xml(namespace)
        
        # properties
        table = make_element 'tbl', namespaces: namespace
        properties = make_element 'tblPr', namespaces: namespace
        style = make_element 'tblStyle', attributes: {'val' => ''}, namespaces: namespace
        properties << style
        
        width = make_element 'tblW', attributes: {'w' => @width.to_s, 'type' => @width_unit.to_s}, namespaces: namespace
        properties << width
        
        # !todo: add borders :P
        
        look = make_element 'look', attributes: {'val' => '0400'}, namespaces: namespace
        properties << look
        table << properties
        
        # grid
        grid = make_element 'tblGrid', namespaces: namespace
        (0...@column_count).each do |i|
          grid << make_element('gridCol', attributes: {'w' => @column_width.to_s}, namespaces: namespace)
        end
        table << grid
        
        # !todo: add heading row
        
        # contents
        @contents.each do |content_row|
          row = make_element 'tr', namespaces: namespace
          content_row.each do |content_cell|
            cell = make_element 'tc', namespaces: namespace
            cell_properties = make_element 'tcPr', namespaces: namespace
            cell_width = make_element 'tcW', attributes: {'w' => '0', 'type' => 'auto'}, namespaces: namespace
            cell_properties << cell_width
            cell << cell_properties
            
            # paragraph (content)
            content_cell = Array(content_cell)
            content_cell.each do |content|
              cell << Paragraph.new(content).to_xml(namespace)
            end
            row << cell
          end
          table << row
        end
        table
      end
      
    end
  end
end


