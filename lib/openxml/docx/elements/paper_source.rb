module OpenXml
  module Docx
    module Properties
      class PaperSource < ComplexProperty
        tag :paperSrc

        with_namespace :w do
          attribute :first, expects: :integer
          attribute :other, expects: :integer
        end

      end
    end
  end
end
