module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapTight < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :wrapTight
        namespace :wp

        attribute :distance_from_left, expects: :positive_integer, displays_as: :distL
        attribute :distance_from_right, expects: :positive_integer, displays_as: :distR
        attribute :wrap_text, one_of: %i(bothSides largest left right), displays_as: :wrapText

      end
    end
  end
end
