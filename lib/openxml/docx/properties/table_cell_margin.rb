module OpenXml
  module Docx
    module Properties
      class TableCellMargin < ComplexProperty
        tag_is_one_of %i(top start bottom end)

        with_namespace :w do
          attribute :type, one_of: %i(auto dxa nil pct)
          attribute :width, expects: :positive_integer, displays_as: :w
        end

      end
    end
  end
end
