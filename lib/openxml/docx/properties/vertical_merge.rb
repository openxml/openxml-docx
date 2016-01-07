module OpenXml
  module Docx
    module Properties
      class VerticalMerge < ValueProperty
        tag :vMerge

        def ok_values
          %i(restart continue)
        end

      end
    end
  end
end
