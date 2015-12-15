module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingAnchor < Container
        tag :anchor
        namespace :wp

        attribute :allowOverlap, expects: :true_or_false
        attribute :behindDoc, expects: :true_or_false
        attribute :distB, expects: :positive_integer
        attribute :distL, expects: :positive_integer
        attribute :distR, expects: :positive_integer
        attribute :distT, expects: :positive_integer
        attribute :hidden, expects: :true_or_false
        attribute :layoutInCell, expects: :true_or_false
        attribute :locked, expects: :true_or_false
        attribute :relativeHeight, expects: :positive_integer
        attribute :simplePos, expects: :true_or_false

      end
    end
  end
end
