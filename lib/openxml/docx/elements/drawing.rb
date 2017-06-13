module OpenXml
  module Docx
    module Elements
      class Drawing < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :drawing

      end
    end
  end
end
