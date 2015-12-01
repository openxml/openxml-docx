module OpenXml
  module Docx
    module Properties
      class VerticalAlignment < ValueProperty
        tag :vertAlign

        def ok_values
          %i(baseline subscript superscript)
        end

      end
    end
  end
end
