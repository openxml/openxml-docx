module OpenXml
  module Docx
    module Elements
      class GridColumn < OpenXml::Docx::Element
        tag :gridCol

        attribute :w, expects: :integer, namespace: :w

      end
    end
  end
end
