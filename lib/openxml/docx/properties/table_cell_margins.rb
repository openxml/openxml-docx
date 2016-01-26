require "openxml/docx/properties/table_cell_margin"

module OpenXml
  module Docx
    module Properties
      class TableCellMargins < ContainerProperty
        tag :tblCellMar
        child_class :table_cell_margin

        def vertical_tags
          %i(top bottom)
        end

        def horizontal_tags
          %i(left right)
        end

        def all_tags
          vertical_tags + horizontal_tags
        end

      end
    end
  end
end
