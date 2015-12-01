module OpenXml
  module Docx
    module Properties
      class PageSize < ComplexProperty
        tag :pgSz

        with_namespace :w do
          attribute :code, expects: :integer
          attribute :height, expects: :positive_integer, displays_as: :h
          attribute :orientation, expects: :valid_orientation, displays_as: :orient
          attribute :width, expects: :positive_integer, displays_as: :w
        end

        VALID_PAGE_ORIENTATIONS = %i(portrait landscape)

      private

        def valid_orientation(value)
          valid_in? value, VALID_PAGE_ORIENTATIONS
        end

      end
    end
  end
end
