module OpenXml
  module Docx
    module Elements
      class BookFoldReversePrinting < Element
        tag :bookFoldRevPrinting

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
