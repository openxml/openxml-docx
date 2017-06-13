module OpenXml
  module Docx
    module Elements
      class FontPanoseOne < OpenXml::Docx::Element
        namespace :w
        tag :panose1

        with_namespace :w do
          attribute :value, expects: :hex_string, displays_as: :val
        end

      end
    end
  end
end
