module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionH < Container
        tag :positionH
        namespace :wp

        attribute :relativeFrom, one_of: %i(character column insideMargin
                                            leftMargin margin outsideMargin page
                                            rightMargin)

      end
    end
  end
end
