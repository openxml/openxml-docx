require "openxml/docx/properties/footer_reference"

module OpenXml
  module Docx
    module Properties
      class FooterReferences < TransparentContainerProperty
        child_class :footer_reference

      end
    end
  end
end
