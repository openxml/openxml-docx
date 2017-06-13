module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingNvGraphicFrameProperties < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :cNvGraphicFramePr
        namespace :wp

      end
    end
  end
end
