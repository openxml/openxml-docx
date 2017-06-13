module OpenXml
  module Docx
    module Elements
      class MarkupCompatibilityAlternateContent < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :AlternateContent
        namespace :mc

      end
    end
  end
end
