module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingSimplePosition < OpenXml::Docx::Element
        tag :simplePos
        namespace :wp

        attribute :x, expects: :integer
        attribute :y, expects: :integer
      end
    end
  end
end
