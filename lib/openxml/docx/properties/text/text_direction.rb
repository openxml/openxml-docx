module OpenXml
  module Docx
    module Properties
      class TextDirection < ValueProperty

        def ok_values
          %i(lr lrV rl rlV tb tbV)
        end

      end
    end
  end
end
