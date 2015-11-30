module OpenXml
  module Docx
    module Properties
      class DocumentGrid < ComplexProperty
        tag :docGrid

        attribute :char_space, expects: :integer
        attribute :line_pitch, expects: :integer
        attribute :type, expects: :valid_grid_type

        VALID_GRID_TYPES = %i(default lines linesAndChars snapToChars)

      private

        def valid_grid_type(value)
          valid_in? value, VALID_GRID_TYPES
        end

      end
    end
  end
end
