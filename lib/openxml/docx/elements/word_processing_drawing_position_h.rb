module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionH < Container
        tag :positionH
        namespace :wp

        attribute :relative_from, one_of: %i(character column insideMargin leftMargin margin outsideMargin page rightMargin), displays_as: :relativeFrom

      end
    end
  end
end
