module OpenXml
  module Docx
    module Properties
      class ManualWidth < ComplexProperty
        tag :fitText

        with_namespace :w do
          attribute :id, expects: :integer
          attribute :width, expects: :positive_integer, displays_as: :val
        end

      end
    end
  end
end
