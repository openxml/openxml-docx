module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapPolygon < Container
        tag :wrapPolygon
        namespace :wp

        attribute :edited, expects: :true_or_false

      end
    end
  end
end
