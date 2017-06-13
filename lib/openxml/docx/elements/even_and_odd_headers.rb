module OpenXml
  module Docx
    module Elements
      class EvenAndOddHeaders < OpenXml::Docx::Element

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
