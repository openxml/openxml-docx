module OpenXml
  module Docx
    module Properties
      class TableCellSpacing < WidthProperty
        tag :tblCellSpacing

        attribute :type, expects: :valid_width_type
        attribute :width, expects: :positive_integer, displays_as: :w

      end
    end
  end
end
