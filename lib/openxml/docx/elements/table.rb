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

      end
    end
  end
end
