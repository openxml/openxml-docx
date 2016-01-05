require "openxml/docx/properties/column"

module OpenXml
  module Docx
    module Properties
      class Section < ContainerProperty
        tag :sectPr
        child_classes :page_size, :page_margins, :columns, :header_reference
      end
    end
  end
end
