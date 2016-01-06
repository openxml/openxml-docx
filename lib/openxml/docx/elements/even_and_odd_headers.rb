module OpenXml
  module Docx
    module Elements
      class EvenAndOddHeaders < Element

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
