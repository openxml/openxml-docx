module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapTopAndBottom < Element
        tag :wrapTopAndBottom
        namespace :wp

        attribute :distance_from_bottom, expects: :positive_integer, displays_as: :distB
        attribute :distance_from_top, expects: :positive_integer, displays_as: :distT

      end
    end
  end
end
