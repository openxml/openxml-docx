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
        @column_width = @width / @column_count
        @contents = contents
        @has_borders = options[:borders] || false
        @border_type = options[:border_type] || 'single'
        @border_color = options[:border_color] || 'auto'
        @headings = options[:headings] || true
      end
      
      def to_xml(namespace)
        with_namespace(namespace) do
          setup_table
          create_grid
          
          @contents.each_with_index do |content_row, i|
            content_row = ContentRow.new(content_row, i, i == 0 && @headings, namespace)
            @table << content_row.build
          end
          
          @table
        end
      end
      
      class ContentRow < XmlElement
        
        def initialize(cells, row_number, headings, namespace)
          @cells = cells
          @row_number = row_number
          @headings = headings
          @namespace = namespace
        end
        
        def build
          row = make_element 'tr'
          @cells.each do |content_cell|
            cell = make_element 'tc'
            cell_properties = make_element 'tcPr'
            cell_width = make_element 'tcW', attributes: {'w' => '0', 'type' => 'auto'}
            cell_properties << cell_width
            if @headings
              cell_style = make_element 'shd', attributes: {'val' => 'clear', 'color' => 'auto', 'fill' => 'FFFFFF', 'themeFill' => 'text2', 'themeFillTint' => '99'}
              cell_properties << cell_style
            end
            
            cell << cell_properties
            content_cell = Array(content_cell)
            content_cell.each do |content|
              cell << Paragraph.new(content).to_xml(@namespace)
            end
            
            row << cell
          end
          
          row
        end
        
      end
      
    private
    
      def setup_table
        @table = make_element 'tbl'
        create_properties
        set_width
        create_borders if @has_borders
        create_look
        @table << @properties
      end
    
      def create_properties
        @properties = make_element 'tblPr'
        style = make_element 'tblStyle', attributes: {'val' => ''}
        @properties << style
      end
      
      def set_width
        width = make_element 'tblW', attributes: {'w' => @width.to_s, 'type' => @width_unit.to_s}
        @properties << width
      end
      
      def create_grid
        grid = make_element 'tblGrid'
        (0...@column_count).each do |i|
          grid << make_element('gridCol', attributes: {'w' => @column_width.to_s})
        end
        @table << grid
      end
      
      def create_borders
        border_types = %w(top left bottom right insideH insideV)
        borders = make_element 'tblBorders'
        border_types.each do |type|
          border_element = make_element type, attributes: {'color' => @border_color, 'space' => "0", 'sz' => "4", "val" => @border_type}
          borders << border_element
        end
        @properties << borders
      end
      
      def create_look
        look = make_element 'look', attributes: {'val' => '0400'}
        @properties << look
      end
      
    end
  end
end


