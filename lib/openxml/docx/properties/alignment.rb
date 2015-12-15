module OpenXml
  module Docx
    module Properties
      class Alignment < ValueProperty
        tag :jc

        def ok_values
          %i(both center distribute end highKashida lowKashida mediumKashida numTab start thaiDistribute left right)
        end

      end
    end
  end
end
