module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionH < Container
        tag :positionH
        namespace :wp

        attribute :relativeFrom, expects: :valid_relative_from

      private

        def valid_relative_from(value)
          raise ArgumentError unless ok_values.include? value
        end

        def ok_values
          %i(character column insideMargin leftMargin margin outsideMargin
          page rightMargin)
        end
      end
    end
  end
end
