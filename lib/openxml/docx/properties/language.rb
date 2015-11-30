module OpenXml
  module Docx
    module Properties
      class Language < ComplexProperty
        tag :lang

        attribute :bidi, expects: :valid_language
        attribute :east_asia, expects: :valid_language
        attribute :latin, expects: :valid_language, displays_as: :val

      private

        def valid_language(value)
          message = "Invalid #{name}: must be a language code (RFC 4646)"
          raise ArgumentError, message unless value =~ /[a-z]{2}-[A-Z]{2}/
        end

      end
    end
  end
end
