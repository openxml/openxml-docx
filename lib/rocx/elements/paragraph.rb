module Rocx
  module Elements
    class Paragraph < BaseContainer
      tag_name :p
      namespace :w
      properties_tag :pPr

      property :alignment
      property :auto_adjust_right_indent
      property :auto_space_de
      property :auto_space_dn
      property :bidi
      property :compress_punctuation
      property :conditional_formatting
      property :contextual_spacing
      property :div_id
      property :keep_lines
      property :keep_next
      property :indentation
      property :mirror_indent
      property :outline_level
      property :overflow_punctuation
      property :page_break_before
      property :snap_to_grid
      property :supress_auto_hyphens
      property :supress_line_numbers
      property :supress_overlap
      property :textbox_tight_wrap
      property :text_direction
      property :vertical_alignment
      property :widow_control
      property :word_wrap
    end
  end
end
