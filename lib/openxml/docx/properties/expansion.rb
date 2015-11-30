module OpenXml
  module Docx
    module Properties
      class Expansion < ValueProperty
        tag :w

        def valid?
          return false unless value =~ /(\d{1,3})%/
          percentage = $1.to_i
          percentage >= 1 && percentage <= 600
        end

        def invalid_message
          "Invalid #{name}: value must be a percentage greater than 0 or less than 601"
        end

      end
    end
  end
end
