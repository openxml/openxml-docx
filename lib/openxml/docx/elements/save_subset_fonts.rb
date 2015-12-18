module OpenXml
  module Docx
    module Elements
      class SaveSubsetFonts < Element
        namespace :w

        with_namespace :w do
          attribute :value, expects: :true_or_false, displays_as: :val
        end

      end
    end
  end
end
