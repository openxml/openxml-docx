module OpenXml
  module Docx
    module Properties
      class Style < ValueProperty

        def valid?
          !value.nil?
        end

        def invalid_message
          "Invalid #{name}: value must not be nil"
        end

      end
    end
  end
end
