module OpenXml
  module Docx
    module Properties
      class StringProperty < ValueProperty

        def valid?
          value.is_a?(String) && !value.length.zero?
        end

        def invalid_message
          "Invalid value for #{name}; string expected (provided: #{value.inspect})"
        end

      end
    end
  end
end
