module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionV < Container
        tag :positionV
        namespace :wp

        attribute :relativeFrom, one_of: %i(bottomMargin insideMargin line
                                            margin outsideMargin page paragraph
                                            topMargin)

      end
    end
  end
end
