module OpenXml
  module Docx
    module Elements
      class MarkupCompatibilityChoice < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :Choice
        namespace :mc

        attribute :requires, expects: :string, displays_as: :Requires

      end
    end
  end
end
