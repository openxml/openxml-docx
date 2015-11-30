module OpenXml
  module Docx
    module Properties
      class LineNumbering < ComplexProperty
        tag :lnNumType

        attribute :count_by, expects: :integer
        attribute :distance, expects: :positive_integer
        attribute :restart, expects: :valid_line_numbering_restart
        attribute :start, expects: :integer

        VALID_LINE_NUMBERING_RESTARTS = %i(continuous newPage newSection)

      private

        def valid_line_numbering_restart(value)
          valid_in? value, VALID_LINE_NUMBERING_RESTARTS
        end

      end
    end
  end
end
