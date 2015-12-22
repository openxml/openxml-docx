module OpenXml
  module Docx
    module Elements
      class EmbedTrueTypeFonts < Element
        namespace :w

        with_namespace :w do
          attribute :value, expects: :boolean, displays_as: :val
        end

      end
    end
  end
end
