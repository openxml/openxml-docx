module OpenXml
  module Docx
    module Properties
      class Emphasis < ValueProperty
        tag :em

        def ok_values
          %i(circle comma dot none underDot)
        end

      end
    end
  end
end
