module OpenXml
  module Docx
    module Elements
      class FontPitch < Element
        namespace :w
        tag :pitch

        with_namespace :w do
          attribute :value, one_of: %i(default fixed variable), displays_as: :val
        end

      end
    end
  end
end
