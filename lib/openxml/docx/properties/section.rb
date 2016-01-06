require "openxml/docx/properties/column"

module OpenXml
  module Docx
    module Properties
      class Section < ContainerProperty
        tag :sectPr
        child_classes :page_size, :page_margins, :columns
      end
    end
  end
end
