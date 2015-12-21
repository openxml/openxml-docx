module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesNvDrawingProperties < Container
        tag :cNvPr
        namespace :wps

        attribute :description, expects: :string, displays_as: :descr
        attribute :hidden, expects: :true_or_false
        attribute :id, expects: :positive_integer
        attribute :object_name, expects: :string, displays_as: :name
        attribute :title, expects: :string

      end
    end
  end
end
