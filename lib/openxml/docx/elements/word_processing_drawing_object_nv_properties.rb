module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingObjectNvProperties < OpenXml::Docx::Element
        tag :docPr
        namespace :wp

        attribute :description, expects: :string, displays_as: :descr
        attribute :hidden, expects: :boolean
        attribute :id, expects: :positive_integer
        attribute :object_name, expects: :string, displays_as: :name
        attribute :title, expects: :string

      end
    end
  end
end
