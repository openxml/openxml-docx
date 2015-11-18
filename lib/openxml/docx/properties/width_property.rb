module OpenXml
  module Docx
    module Properties
      class WidthProperty < ComplexProperty

      protected

        def valid_width_type(value)
          list = %i(auto dxa nil pct)
          message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
          raise ArgumentError, message unless list.include? value
        end

      end
    end
  end
end
