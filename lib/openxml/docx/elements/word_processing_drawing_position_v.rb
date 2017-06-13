module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionV < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :positionV
        namespace :wp

        attribute :relative_from, one_of: %i(bottomMargin insideMargin line margin outsideMargin page paragraph topMargin), displays_as: :relativeFrom

      end
    end
  end
end
