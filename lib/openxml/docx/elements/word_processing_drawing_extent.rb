module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingExtent < Element
        tag :extent
        namespace :wp

        attribute :extent_length, expects: :positive_integer, displays_as: :cx
        attribute :extent_width, expects: :positive_integer, displays_as: :cy

      end
    end
  end
end
