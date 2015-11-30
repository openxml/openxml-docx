module OpenXml
  module Docx
    module Properties
      class Effect < ValueProperty

        def ok_values
          %i(antsBlack antsRed blinkBackground lights none shimmer sparkle)
        end

      end
    end
  end
end
