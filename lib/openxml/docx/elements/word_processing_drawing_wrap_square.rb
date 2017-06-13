module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapSquare < OpenXml::Docx::Element
        tag :wrapSquare
        namespace :wp

        attribute :distance_from_bottom, expects: :positive_integer, displays_as: :distB
        attribute :distance_from_left, expects: :positive_integer, displays_as: :distL
        attribute :distance_from_right, expects: :positive_integer, displays_as: :distR
        attribute :distance_from_top, expects: :positive_integer, displays_as: :distT
        attribute :wrap_text, one_of: %i(bothSides largest left right), displays_as: :wrapText

      end
    end
  end
end
