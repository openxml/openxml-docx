module OpenXml
  module Docx
    module Elements
      class AbsolutePositionTab < Element
        tag :ptab
        attribute :alignment, expects: :valid_ptab_alignment
        attribute :leader, expects: :valid_ptab_leader
        attribute :relativeTo, expects: :valid_ptab_relative_to

        VALID_PTAB_ALIGNMENTS = %i(center left right)
        VALID_PTAB_LEADERS = %i(dot hyphen middleDot none underscore)
        VALID_PTAB_RELATIVE_TOS = %i(indent margin)

      private

        def valid_ptab_alignment(value)
          valid_in? value, VALID_PTAB_ALIGNMENTS
        end

        def valid_ptab_leader(value)
          valid_in? value, VALID_PTAB_LEADERS
        end

        def valid_ptab_relative_to(value)
          valid_in? value, VALID_PTAB_RELATIVE_TOS
        end

      end
    end
  end
end
