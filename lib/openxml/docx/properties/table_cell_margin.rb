module OpenXml
  module Docx
    module Properties
      class TableCellMargin < WidthProperty
        tag_is_one_of %i(top start bottom end)

        with_namespace :w do
          attribute :type, expects: :valid_width_type
          attribute :width, expects: :positive_integer, displays_as: :w
        end

      end
    end
  end
end
