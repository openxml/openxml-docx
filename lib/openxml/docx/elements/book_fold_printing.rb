module OpenXml
  module Docx
    module Elements
      class BookFoldPrinting < OpenXml::Docx::Element
        tag :bookFoldPrinting

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
