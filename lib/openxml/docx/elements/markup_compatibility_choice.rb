module OpenXml
  module Docx
    module Elements
      class MarkupCompatibilityChoice < Container
        tag :Choice
        namespace :mc

        attribute :Required, expects: :string

      end
    end
  end
end
