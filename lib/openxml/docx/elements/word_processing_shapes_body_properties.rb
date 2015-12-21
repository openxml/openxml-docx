module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesBodyProperties < Container
        tag :bodyPr
        namespace :wps

        attribute :anchor, expects: :anchor_value
        attribute :anchor_center, expects: :true_or_false, displays_as: :anchorCtr
        attribute :bottom_inset, expects: :positive_integer, displays_as: :bIns
        attribute :compatible_line_spacing, expects: :true_or_false, displays_as: :compatLnSpc
        attribute :force_anti_alias, expects: :true_or_false, displays_as: :forceAA
        attribute :from_word_art, expects: :true_or_false, displays_as: :fromWordArt
        attribute :horizontal_overflow, expects: :horizontal_overflow_value, displays_as: :horzOverflow
        attribute :left_inset, expects: :positive_integer, displays_as: :lIns
        attribute :number_of_columns, expects: :valid_number_of_columns, displays_as: :numCol
        attribute :right_inset, expects: :positive_integer, displays_as: :rIns
        attribute :rotation, expects: :integer, displays_as: :rot
        attribute :right_to_left_columns, expects: :true_or_false, displays_as: :rtlCol
        attribute :space_between_columns, expects: :positive_integer, displays_as: :spcCol
        attribute :paragraph_spacing, expects: :true_or_false, displays_as: :spcFirstLastPara
        attribute :top_inset, expects: :positive_integer, displays_as: :tIns
        attribute :upright, expects: :true_or_false
        attribute :vertical, expects: :vertical_value, displays_as: :vert
        attribute :vertical_overflow, expects: :vertical_overflow_value, displays_as: :vertOverflow
        attribute :wrap, expects: :wrap_value

      private

        def anchor_value(value)
          raise ArgumentError unless %i(b ctr dist just t).include? value
        end

        def horizontal_overflow_value(value)
          raise ArgumentError unless %i(clip overflow).include? value
        end

        def valid_number_of_columns(value)
          raise ArgumentError unless (1..16).to_a.include? value
        end

        def vertical_value(value)
          ok_values = %i(eaVert horz mongolianVert vert vert270 wordArt Vert wordArtVertRtl)
          raise ArgumentError unless ok_values.include? value
        end

        def vertical_overflow_value(value)
          raise ArgumentError unless %i(clip ellipsis overflow).include? value
        end

        def wrap_value(value)
          raise ArgumentError unless %i(none square).include? value
        end

      end
    end
  end
end
