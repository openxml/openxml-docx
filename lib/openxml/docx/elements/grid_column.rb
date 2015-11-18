module OpenXml
  module Docx
    module Elements
      class GridColumn < Element
        tag :gridColumn

        attribute :w, expects: :valid_number

      private

        def valid_number(value)
          value =~ /^[0-9]+$/
        end

      end
    end
  end
end
