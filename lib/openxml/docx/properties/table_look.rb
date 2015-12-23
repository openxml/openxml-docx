module OpenXml
  module Docx
    module Properties
      class TableLook < ComplexProperty
        tag :tblLook

        with_namespace :w do
          attribute :firstColumn, expects: :boolean
          attribute :firstRow, expects: :boolean
          attribute :lastColumn, expects: :boolean
          attribute :lastRow, expects: :boolean
          attribute :noHBand, expects: :boolean
          attribute :noVBand, expects: :boolean
          attribute :value, expects: :hex_digit_4, displays_as: :val, deprecated: true
        end

      end
    end
  end
end
