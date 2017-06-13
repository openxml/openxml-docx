module OpenXml
  module Docx
    module Elements
      class SectionProperties < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :sectPr

      end
    end
  end
end
