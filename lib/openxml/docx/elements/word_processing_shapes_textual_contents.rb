module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesTextualContent < Container
        tag :txbx
        namespace :wps

        attribute :id, expects: :positive_integer

      end
    end
  end
end
