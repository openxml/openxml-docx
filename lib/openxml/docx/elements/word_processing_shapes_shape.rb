module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesShape < Container
        tag :wsp
        namespace :wps

        attribute :normalEastAsianFlow, expects: :true_or_false
      end
    end
  end
end
