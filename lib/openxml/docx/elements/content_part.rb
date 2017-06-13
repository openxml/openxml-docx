module OpenXml
  module Docx
    module Elements
      class ContentPart < OpenXml::Docx::Element
        attribute :id, expects: :string, namespace: :r

      end
    end
  end
end
