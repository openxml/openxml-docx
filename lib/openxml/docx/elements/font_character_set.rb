module OpenXml
  module Docx
    module Elements
      class FontCharacterSet < OpenXml::Docx::Element
        namespace :w
        tag :charset

        with_namespace :w do
          attribute :character_set, expects: :string, displays_as: :characterSet
        end

      end
    end
  end
end
