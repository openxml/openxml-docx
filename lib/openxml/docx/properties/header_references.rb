require "openxml/docx/properties/header_reference"

module OpenXml
  module Docx
    module Properties
      class HeaderReferences < TransparentContainerProperty
        child_class :header_reference

      end
    end
  end
end
