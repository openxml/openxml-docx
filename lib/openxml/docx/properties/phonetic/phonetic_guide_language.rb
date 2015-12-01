module OpenXml
  module Docx
    module Properties
      class PhoneticGuideLanguage < ValueProperty
        tag :lid
        name "language"

        def valid?
          value =~ /[a-z]{2}-[A-Z]{2}/
        end

        def invalid_message
          "Invalid #{name}: must be a language code (RFC 4646)"
        end

      end
    end
  end
end
