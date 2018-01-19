module OpenXml
  module Docx
    module Properties
      class MultiLevelType < ValueProperty
        tag :multiLevelType

        def ok_values
          %i(singleLevel multilevel hybridMultilevel)
        end

      end
    end
  end
end
