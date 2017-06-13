module OpenXml
  module Docx
    module Elements
      class GroupShape < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :grpSp

      end
    end
  end
end
