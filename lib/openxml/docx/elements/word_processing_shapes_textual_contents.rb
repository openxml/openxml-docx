module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesTextualContent < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :txbx
        namespace :wps

        attribute :id, expects: :positive_integer

      end
    end
  end
end
