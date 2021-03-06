module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingAnchor < OpenXml::Docx::Element
        include HasChildren, HasProperties

        tag :anchor
        namespace :wp

        attribute :allow_overlap, expects: :boolean, displays_as: :allowOverlap               # Required
        attribute :behind_document, expects: :boolean, displays_as: :behindDoc                # Required
        attribute :distance_from_bottom, expects: :positive_integer, displays_as: :distB      # Optional
        attribute :distance_from_left, expects: :positive_integer, displays_as: :distL        # Optional
        attribute :distance_from_right, expects: :positive_integer, displays_as: :distR       # Optional
        attribute :distance_from_top, expects: :positive_integer, displays_as: :distT         # Optional
        attribute :hidden, expects: :boolean                                                  # Optional
        attribute :layout_in_cell, expects: :boolean, displays_as: :layoutInCell              # Required
        attribute :locked, expects: :boolean                                                  # Required
        attribute :z_index, expects: :positive_integer, displays_as: :relativeHeight          # Required
        attribute :simple_position, expects: :boolean, displays_as: :simplePos                # Optional

        # Children elements required by spec: <docPr>, <a:graphic>, <wp:simplePos>, <wp:positionH>, <wp:positionV>, <wp:extent>, and one of the wp: wrap type tags

      end
    end
  end
end
