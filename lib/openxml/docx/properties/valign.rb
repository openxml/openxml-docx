module OpenXml
  module Docx
    module Properties
      class VAlign < ValueProperty

        def ok_values
          %i(both bottom center top)
        end

      end
    end
  end
end
