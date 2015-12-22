module OpenXml
  module Docx
    module Elements
      class BookFoldPrinting < Element
        tag :bookFoldPrinting

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
