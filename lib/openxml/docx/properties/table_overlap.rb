module OpenXml
  module Docx
    module Properties
      class TableOverlap < ValueProperty
        tag :tblOverlap

        def ok_values
          %i(never overlap)
        end

      end
    end
  end
end
