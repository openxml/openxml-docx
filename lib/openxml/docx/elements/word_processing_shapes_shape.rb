module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesShape < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :wsp
        namespace :wps
        attribute :normal_east_asian_flow, expects: :boolean, displays_as: :normalEastAsianFlow

      end
    end
  end
end
