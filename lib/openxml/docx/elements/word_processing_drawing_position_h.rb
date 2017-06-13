module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionH < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :positionH
        namespace :wp

        attribute :relative_from, one_of: %i(character column insideMargin leftMargin margin outsideMargin page rightMargin), displays_as: :relativeFrom

      end
    end
  end
end
