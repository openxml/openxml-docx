require "openxml/docx/properties/table/table_cell_margin"

module OpenXml
  module Docx
    module Properties
      class TableCellMargins < ContainerProperty
        tag :tblCellMar
        child_class :table_cell_margin

      end
    end
  end
end
