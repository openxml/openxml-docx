module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesShape < Container
        tag :wsp
        namespace :wps

        attribute :normal_east_asian_flow, expects: :true_or_false, displays_as: :normalEastAsianFlow
      end
    end
  end
end
