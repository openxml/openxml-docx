module OpenXml
  module Docx
    module Elements
      class BidiOverride < Container
        tag :bdo
        attribute :direction, expects: :valid_direction, displays_as: :val

        VALID_DIRECTIONS = %i(rtl ltr)

      private

        def valid_direction(value)
          valid_in? value, VALID_DIRECTIONS
        end

      end
    end
  end
end
