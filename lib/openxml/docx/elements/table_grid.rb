module OpenXml
  module Docx
    module Elements
      class TableGrid < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :tblGrid

      end
    end
  end
end
