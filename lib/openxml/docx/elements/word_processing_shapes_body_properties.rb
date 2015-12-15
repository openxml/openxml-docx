module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesBodyProperties < Container
        tag :bodyPr
        namespace :wps

        attribute :anchor, one_of: %i(b ctr dist just t)
        attribute :anchorCtr, expects: :true_or_false
        attribute :bottom_inset, expects: :positive_integer, displays_as: :bIns
        attribute :compatible_line_spacing, expects: :true_or_false, displays_as: :compatLnSpc
        attribute :force_anti_alias, expects: :true_or_false, displays_as: :forceAA
        attribute :fromWordArt, expects: :true_or_false
        attribute :horzOverflow, one_of: %i(clip overflow)
        attribute :left_inset, expects: :positive_integer, displays_as: :lIns
        attribute :numCol, one_of: (1..16).to_a
        attribute :right_inset, expects: :positive_integer, displays_as: :rIns
        attribute :rotation, expects: :integer, displays_as: :rot
        attribute :right_to_left_columns, expects: :true_or_false, displays_as: :rtlCol
        attribute :space_between_columns, expects: :positive_integer, displays_as: :spcCol
        attribute :paragraph_spacing, expects: :true_or_false, displays_as: :spcFirstLastPara
        attribute :top_inset, expects: :positive_integer, displays_as: :tIns
        attribute :upright, expects: :true_or_false
        attribute :vert, one_of: %i(eaVert horz mongolianVert vert vert270 wordArt Vert wordArtVertRtl)
        attribute :vertOverflow, one_of: %i(clip ellipsis overflow)
        attribute :wrap, one_of: %i(none square)
      end
    end
  end
end
