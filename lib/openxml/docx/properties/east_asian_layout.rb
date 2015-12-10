module OpenXml
  module Docx
    module Properties
      class EastAsianLayout < ComplexProperty

        with_namespace :w do
          attribute :combine, expects: :on_or_off
          attribute :combine_brackets, one_of: %i(angle curly none round square)
          attribute :id, expects: :integer
          attribute :vertical, expects: :on_or_off, displays_as: :vert
          attribute :vertical_compress, expects: :on_or_off, displays_as: :vertCompress
        end

      end
    end
  end
end
