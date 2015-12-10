module OpenXml
  module Docx
    module Elements
      class DeletedText < Text
        tag :del
        attribute :space, one_of: [:preserve, nil], namespace: :xml
      end
    end
  end
end
