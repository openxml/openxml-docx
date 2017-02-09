module OpenXml
  module Docx
    module Elements
      class Table < Container
        tag :tbl

        value_property :bidi_visual, as: :bidi
        value_property :cant_split
        value_property :div_id
        value_property :alignment
        value_property :table_caption
        value_property :table_description
        value_property :table_overlap
        value_property :table_style

        property :conditional_formatting
        property :shading
        property :table_borders
        property :table_cell_margins
        property :table_cell_spacing
        property :table_indent
        property :table_layout
        property :table_look
        property :table_p_pr
        property :table_width

        def width(*args)
          return table_width.width if args.empty?
          table_width.width = args.first
          table_width.type = :dxa if table_width.type == :auto
          self
        end

        def width_unit(*args)
          return table_width.type if args.empty?
          table_width.type = args.first
          self
        end

      private

        def build_scaffold
          table_width.type = :auto
          table_width.width = 0
          table_layout.type = :fixed
          push OpenXml::Docx::Elements::TableGrid.new
        end

      end
    end
  end
end
