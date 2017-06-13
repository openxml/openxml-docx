module OpenXml
  module Docx
    module Elements
      class TextboxContent < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :txbxContent

      end
    end
  end
end
