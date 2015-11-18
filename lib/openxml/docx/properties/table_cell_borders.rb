require "openxml/docx/properties/table_cell_border"

module OpenXml
  module Docx
    module Properties
      class TableCellBorders < ContainerProperty
        tag :tcBorders
        child_class :table_cell_border

      end
    end
  end
end
