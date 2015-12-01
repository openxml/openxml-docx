module OpenXml
  module Docx
    module Elements
      class Break < Element
        tag :br

        with_namespace :w do
          attribute :clear, expects: :valid_clear
          attribute :type, expects: :valid_break_type
        end

        VALID_CLEARS = %i(all left none right)
        VALID_BREAK_TYPES = %i(column page textWrapping)

      private

        def valid_clear(value)
          valid_in? value, VALID_CLEARS
        end

        def valid_break_type(value)
          valid_in? value, VALID_BREAK_TYPES
        end

      end
    end
  end
end
