module OpenXml
  module Docx
    module Properties
      class Indentation < ComplexProperty
        tag :ind

        with_namespace :w do
          attribute :end, expects: :integer
          attribute :end_characters, expects: :integer, displays_as: :endChars
          attribute :hanging, expects: :integer
          attribute :hanging_characters, expects: :integer, displays_as: :hangingChars
          attribute :first_line, expects: :integer, displays_as: :firstLine
          attribute :first_line_characters, expects: :integer, displays_as: :firstLineChars
          attribute :left, expects: :integer, deprecated: true
          attribute :left_characters, expects: :integer, displays_as: :leftChars, deprecated: true
          attribute :right, expects: :integer, deprecated: true
          attribute :right_characters, expects: :integer, displays_as: :rightChars, deprecated: true
          attribute :start, expects: :integer
          attribute :start_characters, expects: :integer, displays_as: :startChars
        end

      end
    end
  end
end
