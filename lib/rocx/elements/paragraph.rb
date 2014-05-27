module Rocx
  module Elements
    class Paragraph < BaseContainer
      tag_name :p
      namespace :w
      properties_tag :pPr
      property :alignment
      property :indentation
      property :auto_adjust_right_indent
      property :bidi
      property :contextual_spacing
      property :keep_lines
      property :keep_next
      property :mirror_indent
      property :page_break_before
      property :supress_auto_hyphens
      property :supress_line_numbers
      property :supress_overlap

    end
  end
end
