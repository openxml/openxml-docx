require "openxml/docx/properties/columns"
require "openxml/docx/properties/page_margins"
require "openxml/docx/properties/page_size"
require "openxml/docx/properties/header_reference"
require "openxml/docx/properties/section_type"

module OpenXml
  module Docx
    module Properties
      class Section < ContainerProperty
        tag :sectPr
        child_classes :page_size, :page_margins, :columns, :header_reference, :section_type
      end
    end
  end
end
