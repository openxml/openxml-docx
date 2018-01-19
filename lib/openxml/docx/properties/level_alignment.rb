module OpenXml
  module Docx
    module Properties
      class LevelAlignment < ValueProperty
        tag :lvlJc

        def ok_values
          %i(both center distribute end highKashida lowKashida mediumKashida numTab start thaiDistribute left right)
        end

      end
    end
  end
end
