module OpenXml
  module Docx
    module Elements
      class AbsolutePositionTab < Element
        tag :ptab

        with_namespace :w do
          attribute :alignment, one_of: %i(center left right)
          attribute :leader, one_of: %i(dot hyphen middleDot none underscore)
          attribute :relative_to, one_of: %i(indent margin), displays_as: :relativeTo
        end

      end
    end
  end
end
