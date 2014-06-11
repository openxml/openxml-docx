module Rocx
  module Properties
    class Indentation < ComplexProperty
      include AttributeBuilder

      tag :ind

      attribute :end, expects: :integer
      attribute :end_characters, expects: :integer, displays_as: :endChars
      attribute :hanging, expects: :integer
      attribute :hanging_characters, expects: :integer, displays_as: :hangingChars
      attribute :first_line, expects: :integer
      attribute :first_line_characters, expects: :integer, displays_as: :firstLineChars
      attribute :start, expects: :integer
      attribute :start_characters, expects: :integer, displays_as: :startChars
    end
  end
end
