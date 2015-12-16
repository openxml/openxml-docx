module OpenXml
  module Docx
    module Elements
      class BookFoldPrinting < Element
        tag :bookFoldPrinting

        attribute :value, expects: :true_or_false, displays_as: :val, namespace: :w

      end
    end
  end
end
