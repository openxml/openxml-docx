module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesShapeProperties < Container
        tag :spPr
        namespace :wps

        attribute :bwMode, expects: :valid_colors

      private

        def valid_colors(value)
          raise ArgumentError unless ok_values.include? value
        end

        def ok_values
          %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white)
        end

      end
    end
  end
end
