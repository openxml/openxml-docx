require "openxml/docx/properties/table/table_cell_margin"

module OpenXml
  module Docx
    module Properties
      class TableCellCellMargin < ContainerProperty
        tag :tcMar
        child_class :table_cell_margin

      end
    end
  end
end
