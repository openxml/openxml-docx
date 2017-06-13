module OpenXml
  module Docx
    module Elements
      class BookFoldPrintingSheets < OpenXml::Docx::Element
        tag :bookFoldPrintingSheets

        attribute :value, expects: :positive_integer, displays_as: :val, namespace: :w

      end
    end
  end
end
