module OpenXml
  module Docx
    module Elements
      class ContentPart < Element
        attribute :id, expects: :string, namespace: :r

      end
    end
  end
end
