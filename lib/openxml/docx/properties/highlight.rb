module OpenXml
  module Docx
    module Properties
      class Highlight < ValueProperty

        def ok_values
          %i(black blue cyan darkBlue darkCyan darkGray darkGreen darkMagenta darkRed darkYellow green lightGray magenta none red white yellow)
        end

      end
    end
  end
end
