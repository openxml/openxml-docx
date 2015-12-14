module OpenXml
  module Docx
    module Elements
      class AbsolutePositionTab < Element
        tag :ptab

        with_namespace :w do
          attribute :alignment, one_of: %i(center left right)
          attribute :leader, one_of: %i(dot hyphen middleDot none underscore)
          attribute :relativeTo, one_of: %i(indent margin)
        end

      end
    end
  end
end
