require "openxml/docx/properties/tab"

module OpenXml
  module Docx
    module Properties
      class Tabs < ContainerProperty
        child_class :tab

      end
    end
  end
end
