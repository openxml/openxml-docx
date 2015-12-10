module OpenXml
  module Docx
    module Properties
      class LineNumbering < ComplexProperty
        tag :lnNumType

        with_namespace :w do
          attribute :count_by, expects: :integer
          attribute :distance, expects: :positive_integer
          attribute :restart, one_of: %i(continuous newPage newSection)
          attribute :start, expects: :integer
        end

      end
    end
  end
end
