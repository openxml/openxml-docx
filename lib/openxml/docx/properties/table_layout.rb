module OpenXml
  module Docx
    module Properties
      class TableLayout < ValueProperty
        tag :tblLayout

        def ok_values
          %i(autofit fixed)
        end

      end
    end
  end
end
