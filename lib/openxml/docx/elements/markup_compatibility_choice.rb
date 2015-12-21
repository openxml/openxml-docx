module OpenXml
  module Docx
    module Elements
      class MarkupCompatibilityChoice < Container
        tag :Choice
        namespace :mc

        attribute :requires, expects: :string, displays_as: :Requires

      end
    end
  end
end
