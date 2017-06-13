module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingInline < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :inline
        namespace :wp

        attribute :distance_from_bottom, expects: :positive_integer, displays_as: :distB
        attribute :distance_from_left, expects: :positive_integer, displays_as: :distL
        attribute :distance_from_right, expects: :positive_integer, displays_as: :distR
        attribute :distance_from_top, expects: :positive_integer, displays_as: :distT

      end
    end
  end
end
