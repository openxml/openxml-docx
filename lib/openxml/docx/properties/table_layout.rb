module OpenXml
  module Docx
    module Properties
      class TableLayout < ComplexProperty
        tag :tblLayout

        attribute :type, one_of: %i(autofit fixed), namespace: :w

      end
    end
  end
end
