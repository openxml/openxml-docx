module OpenXml
  module Docx
    module Properties
      class DocumentGrid < ComplexProperty
        tag :docGrid

        with_namespace :w do
          attribute :char_space, expects: :integer
          attribute :line_pitch, expects: :integer
          attribute :type, one_of: %i(default lines linesAndChars snapToChars)
        end

      end
    end
  end
end
