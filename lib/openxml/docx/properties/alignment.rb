module OpenXml
  module Docx
    module Properties
      class Alignment < ValueProperty
        tag :jc

        def ok_values
          [:both, :center, :distribute, :end, :highKashida, :lowKashida, :mediumKashida, :numTab, :start, :thaiDistribute]
        end

      end
    end
  end
end
