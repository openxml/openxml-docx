module Rocx
  module Elements
    class Paragraph < BaseContainer
      tag_name :p
      namespace :w
      properties_tag :pPr

      value_property :alignment
      value_property :auto_adjust_right_indent
      value_property :auto_space_de
      value_property :auto_space_dn
      value_property :bidi
      value_property :compress_punctuation
      value_property :conditional_formatting
      value_property :contextual_spacing
      value_property :div_id
      value_property :keep_lines
      value_property :keep_next
      value_property :indentation
      value_property :mirror_indent
      value_property :outline_level
      value_property :overflow_punctuation
      value_property :page_break_before
      value_property :snap_to_grid
      value_property :style
      value_property :supress_auto_hyphens
      value_property :supress_line_numbers
      value_property :supress_overlap
      value_property :textbox_tight_wrap
      value_property :text_alignment
      value_property :text_direction
      value_property :widow_control
      value_property :word_wrap

      property :borders
      property :frame
      property :numbering
      property :shading
      property :spacing
      property :tabs
    end
  end
end
