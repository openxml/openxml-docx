module OpenXml
  module Docx
    module Elements
      class EmbedBoldItalic < Element
        namespace :w

        with_namespace :w do
          attribute :font_key, displays_as: :fontKey, matches: /\{[0-9A-F]{8}\-[0-9A-F]{4}\-[0-9A-F]{4}\-[0-9A-F]{4}\-[0-9A-F]{12}\}/ # Regex taken from spec section 22.9.2.4
          attribute :subsetted, expects: :true_or_false
        end

        attribute :relationship_id, expects: :string, displays_as: :id, namespace: :r

      end
    end
  end
end
