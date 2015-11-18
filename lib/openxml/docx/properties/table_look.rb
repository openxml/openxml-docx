module OpenXml
  module Docx
    module Properties
      class TableLook < ComplexProperty
        tag :tblLook

        attribute :firstColumn, expects: :true_or_false
        attribute :firstRow, expects: :true_or_false
        attribute :lastColumn, expects: :true_or_false
        attribute :lastRow, expects: :true_or_false
        attribute :noHBand, expects: :true_or_false
        attribute :noVBand, expects: :true_or_false

      end
    end
  end
end
