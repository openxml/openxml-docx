module OpenXml
  module Docx
    module Properties
      class Suffix < ValueProperty
        tag :suff

        def ok_values
          %i(tab space nothing)
        end
      end
    end
  end
end
