module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingEffectExtent < Element
        tag :effectExtent
        namespace :wp

        attribute :bottom_edge, expects: :integer, displays_as: :b
        attribute :left_edge, expects: :integer, displays_as: :l
        attribute :right_edge, expects: :integer, displays_as: :r
        attribute :top_edge, expects: :integer, displays_as: :t

      end
    end
  end
end
