require "openxml/docx/properties/header"

module OpenXml
  module Docx
    module Properties
      class Headers < ContainerProperty
        child_class :header

      end
    end
  end
end
