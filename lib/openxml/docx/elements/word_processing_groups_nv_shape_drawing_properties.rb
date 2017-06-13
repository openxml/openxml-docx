module OpenXml
  module Docx
    module Elements
      class WordProcessingGroupsNvShapeDrawingProperties < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :cNvGrpSpPr
        namespace :wpg

      end
    end
  end
end
