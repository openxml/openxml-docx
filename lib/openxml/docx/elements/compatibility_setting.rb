module OpenXml
  module Docx
    module Elements
      class CompatibilitySettings < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :compat

      end
    end
  end
end
