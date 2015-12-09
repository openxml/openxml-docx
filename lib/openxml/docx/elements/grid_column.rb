module OpenXml
  module Docx
    module Elements
      class GridColumn < Element
        tag :gridColumn

        attribute :w, expects: :integer, namespace: :w

      end
    end
  end
end
