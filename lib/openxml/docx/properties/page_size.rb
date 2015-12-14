module OpenXml
  module Docx
    module Properties
      class PageSize < ComplexProperty
        tag :pgSz

        with_namespace :w do
          attribute :code, expects: :integer
          attribute :height, expects: :positive_integer, displays_as: :h
          attribute :orientation, one_of: %i(portrait landscape), displays_as: :orient
          attribute :width, expects: :positive_integer, displays_as: :w
        end
      end
    end
  end
end
