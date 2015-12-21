module OpenXml
  module Docx
    module Elements
      class EmbedRegular < Element
        namespace :w

        with_namespace :w do
          attribute :font_key, displays_as: :fontKey, matches: /\{[0-9A-F]{8}\-[0-9A-F]{4}\-[0-9A-F]{4}\-[0-9A-F]{4}\-[0-9A-F]{12}\}/ # Regex taken from spec section 22.9.2.4
          attribute :subsetted, expects: :true_or_false
        end

        attribute :relationship_id, expects: :string, displays_as: :id, namespace: :r


      private

        def bracketed_guid(value)
          guid_regex =
          raise ArgumentError, "Not a validly-formatted GUID (#{value})" unless value =~ guid_regex
        end

      end
    end
  end
end
