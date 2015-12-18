module OpenXml
  module Docx
    module Elements
      class FontAlternateName < Element
        namespace :w
        tag :altName

        with_namespace :w do
          attribute :value, expects: :string, displays_as: :val
        end

      end
    end
  end
end
