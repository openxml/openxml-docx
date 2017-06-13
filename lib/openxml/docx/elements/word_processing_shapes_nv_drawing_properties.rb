module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesNvDrawingProperties < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :cNvPr
        namespace :wps

        attribute :description, expects: :string, displays_as: :descr
        attribute :hidden, expects: :boolean
        attribute :id, expects: :positive_integer
        attribute :object_name, expects: :string, displays_as: :name
        attribute :title, expects: :string

      end
    end
  end
end
