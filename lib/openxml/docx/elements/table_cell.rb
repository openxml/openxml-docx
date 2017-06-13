module OpenXml
  module Docx
    module Elements
      class TableCell < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :tc

        attribute :id, namespace: :w

        value_property :div_id
        value_property :grid_span
        value_property :hide_mark
        value_property :no_wrap
        value_property :table_cell_fit_text
        value_property :text_direction
        value_property :v_align
        value_property :vertical_merge

        property :conditional_formatting
        property :headers
        property :shading
        property :table_cell_borders
        property :table_cell_cell_margin
        property :table_cell_width

      end
    end
  end
end
