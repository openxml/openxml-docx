module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapPolygon < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :wrapPolygon
        namespace :wp

        attribute :edited, expects: :boolean

      end
    end
  end
end
