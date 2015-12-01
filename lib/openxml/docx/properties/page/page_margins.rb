module OpenXml
  module Docx
    module Properties
      class PageMargins < ComplexProperty
        tag :pgMar

        attribute :bottom, expects: :integer
        attribute :footer, expects: :positive_integer
        attribute :gutter, expects: :positive_integer
        attribute :header, expects: :positive_integer
        attribute :left, expects: :positive_integer
        attribute :right, expects: :positive_integer
        attribute :top, expects: :integer
      end
    end
  end
end
