module OpenXml
  module Docx
    module Elements
      class Symbol < OpenXml::Docx::Element
        tag :sym

        with_namespace :w do
          attribute :font, expects: :string
          attribute :character, expects: :hex_digit_4, displays_as: :char
        end

      end
    end
  end
end
