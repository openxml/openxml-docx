module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapPolygon < Container
        tag :wrapPolygon
        namespace :wp

        attribute :edited, expects: :boolean

      end
    end
  end
end
