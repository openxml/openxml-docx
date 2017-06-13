module OpenXml
  module Docx
    module Elements
      class VmlContainer < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :pict

      end
    end
  end
end
