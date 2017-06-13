module OpenXml
  module Docx
    module Elements
      class MarkupCompatibilityFallback < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :Fallback
        namespace :mc

      end
    end
  end
end
