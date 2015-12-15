module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionV < Container
        tag :positionV
        namespace :wp

        attribute :relativeFrom, expects: :valid_relative_from

      private

        def valid_relative_from(value)
          raise ArgumentError unless ok_values.include? value
        end

        def ok_values
          %i(bottomMargin insideMargin line margin outsideMargin page
          paragraph topMargin)
        end
      end
    end
  end
end
