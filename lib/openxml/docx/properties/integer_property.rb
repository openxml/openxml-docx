module OpenXml
  module Docx
    module Properties
      class IntegerProperty < ValueProperty

        def valid?
          value.is_a? Integer
        end

        def invalid_message
          "Invalid #{name}: must be an integer"
        end

      end
    end
  end
end
