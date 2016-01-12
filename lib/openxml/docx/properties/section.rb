require "openxml/docx/properties/column"
require "openxml/docx/properties/page_margins"
require "openxml/docx/properties/page_size"
require "openxml/docx/properties/header_reference"

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
