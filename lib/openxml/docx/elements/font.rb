module OpenXml
  module Docx
    module Elements
      class Font < OpenXml::Docx::Element
        include HasChildren, HasProperties

        namespace :w

        with_namespace :w do
          attribute :font_name, expects: :string, displays_as: :name
        end

      end
    end
  end
end
