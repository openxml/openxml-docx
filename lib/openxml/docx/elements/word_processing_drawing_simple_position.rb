module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingSimplePosition < Element
        tag :simplePos
        namespace :wp

        attribute :x, expects: :integer
        attribute :y, expects: :integer
      end
    end
  end
end
