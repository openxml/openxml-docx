module OpenXml
  module Docx
    module Properties
      class ParentStyle < ValueProperty
        tag :basedOn

        def valid?
          value.is_a?(String) && value.length > 0
        end

        def invalid_message
          "#{name} must be a string that is not empty"
        end
      end
    end
  end
end
