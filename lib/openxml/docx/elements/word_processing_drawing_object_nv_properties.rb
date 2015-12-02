module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingObjectNvProperties < Element
        tag :docPr
        namespace :wp

        attribute :description, expects: :string, displays_as: :descr
        attribute :hidden, expects: :true_or_false
        attribute :id, expects: :positive_integer
        attribute :property_name, expects: :string, displays_as: :name
        attribute :title, expects: :string

      end
    end
  end
end
