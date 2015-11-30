module OpenXml
  module Docx
    module Properties
      class Column < ComplexProperty
        tag :col

        attribute :space, expects: :positive_integer
        attribute :width, expects: :positive_integer, displays_as: :w

        def initialize(space, width)
          self.space = space
          self.width = width
        end

      end
    end
  end
end
