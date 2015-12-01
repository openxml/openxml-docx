require "openxml/docx/properties/table/table_border"

module OpenXml
  module Docx
    module Properties
      class TableBorders < ContainerProperty
        tag :tblBorders
        child_class :table_border

      end
    end
  end
end
