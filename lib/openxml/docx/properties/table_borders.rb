require "openxml/docx/properties/table_border"

module OpenXml
  module Docx
    module Properties
      class TableBorders < ContainerProperty
        tag :tblBorders
        child_class :table_border

        def vertical_tags
          %i(left right insideV)
        end

        def horizontal_tags
          %i(top bottom insideH)
        end

        def all_tags
          vertical_tags + horizontal_tags
        end

      end
    end
  end
end
