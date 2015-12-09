module OpenXml
  module Docx
    module Properties
      class Column < ComplexProperty
        tag :col

        with_namespace :w do
          attribute :space, expects: :positive_integer
          attribute :width, expects: :positive_integer, displays_as: :w
        end

        def initialize(space, width)
          self.space = space
          self.width = width
        end

      end
    end
  end
end
