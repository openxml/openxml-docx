module OpenXml
  module Vml
    module Elements
      class RoundedRectangle < OpenXml::Docx::Elements::Container
        namespace :v
        tag :roundrect

        attribute :alternate_text, expects: :string, displays_as: :alt
        attribute :arc_size, expects: :valid_arc_size, displays_as: :arcsize
        attribute :chroma_key, expects: :valid_color, displays_as: :chromakey
        attribute :css_class, expects: :string, displays_as: :class
        attribute :coordinate_origin, expects: :valid_coordinate, displays_as: :coordorigin
        attribute :coordinate_size, expects: :valid_coordinate, displays_as: :coordsize
        attribute :fill_color, expects: :valid_color, displays_as: :fillcolor
        attribute :filled, expects: :explicit_true_false
        attribute :href, expects: :string
        attribute :id, expects: :string
        attribute :inset_pen, expects: :explicit_true_false, displays_as: :insetpen
        attribute :opacity, expects: :string # Can be a float or 1/65536ths when followed by `f`
        attribute :print, expects: :explicit_true_false
        attribute :stroke_color, expects: :valid_color, displays_as: :strokecolor
        attribute :stroked, expects: :explicit_true_false
        attribute :stroke_weight, expects: :string, displays_as: :strokeweight # Expects number with units
        attribute :style, expects: :string
        attribute :target, expects: :string
        attribute :title, expects: :string
        attribute :wrap_coordinates, expects: :string, displays_as: :wrapcoords

        with_namespace :o do
          attribute :allow_in_cell, expects: :explicit_true_false, displays_as: :allowincell
          attribute :allow_overlap, expects: :explicit_true_false, displays_as: :allowoverlap
          attribute :border_bottom_color, expects: :string, displays_as: :borderbottomcolor
          attribute :border_left_color, expects: :string, displays_as: :borderleftcolor
          attribute :border_right_color, expects: :string, displays_as: :borderrightcolor
          attribute :border_top_color, expects: :string, displays_as: :bordertopcolor
          attribute :bullet, expects: :explicit_true_false
          attribute :button, expects: :explicit_true_false
          attribute :bw_mode, displays_as: :bwmode, one_of: %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
          attribute :bw_normal, displays_as: :bwnormal, one_of: %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
          attribute :bw_pure, displays_as: :bwpure, one_of: %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
          attribute :clip, expects: :explicit_true_false
          attribute :clip_to_wrap, expects: :explicit_true_false, displays_as: :cliptowrap
          attribute :connector_type, one_of: %i(curved elbow none straight), displays_as: :connectortype
          attribute :diagram_node_layout, expects: :valid_diagram_layout, displays_as: :dgmlayout
          attribute :diagram_node_recent_layout, expects: :valid_diagram_layout, displays_as: :dgmlayoutmru
          attribute :diagram_node_kind, expects: :integer, displays_as: :dgmnodekind
          attribute :double_click_notify, expects: :explicit_true_false, displays_as: :doubleclicknotify
          attribute :force_dash, expects: :explicit_true_false, displays_as: :forcedash
          attribute :hr, expects: :explicit_true_false
          attribute :hr_align, one_of: %i(center left right), displays_as: :hralign
          attribute :hr_no_shade, expects: :explicit_true_false, displays_as: :hrnoshade
          attribute :hr_percent, expects: :integer, displays_as: :hrpct
          attribute :hr_standard, expects: :explicit_true_false, displays_as: :hrstd
          attribute :inset_mode, one_of: %i(auto custom), displays_as: :insetmode
          attribute :ole, expects: :explicit_true_false
          attribute :ole_icon, expects: :explicit_true_false, displays_as: :oleicon
          attribute :hide_extra_handles, expects: :explicit_true_false, displays_as: :oned
          attribute :prefer_relative, expects: :explicit_true_false, displays_as: :preferrelative
          attribute :regroup_id, expects: :integer, displays_as: :regroupid
          attribute :optional_string, expects: :string, displays_as: :spid
          attribute :optional_number, expects: :string, displays_as: :spt # Actually expects float
          attribute :user_drawn, expects: :explicit_true_false, displays_as: :userdrawn
          attribute :user_hidden, expects: :explicit_true_false, displays_as: :userhidden
        end

      private

        def valid_arc_size(value)
          message = "Invalid arc size. Requires a percent or value in terms of f."
          raise ArgumentError, message unless value.is_a?(String) && value =~ /^[0-9]+[%f]$/
        end

        def valid_color(value)
          ok_color_names = %i(black silver gray white maroon red purple fuchsia green lime olive yellow navy blue teal aqua)
          valid_hex = /#[0-9a-f]{6}/i
          valid_palette_entry = /^\w+(?:\s\[[0-9]+\])?$/
          message = "Invalid color. Please specify a color name, a hex value (with #), or a palette entry."
          raise ArgumentError, message unless ok_color_names.include?(value) || value =~ valid_hex || value =~ valid_palette_entry
        end

        def valid_coordinate(value)
          raise ArgumentError, "Invalid coordinates." unless value =~ /^[\-0-9]+,\s?[\-0-9]+$/
        end

        def valid_diagram_layout(value)
          message = "Invalid diagram layout. Must be a single digit between 0 and 3 inclusive"
          raise ArgumentError, message unless (value.is_a?(Fixnum) && (0..3).include?(value)) || value =~ /^[0-3]$/
        end

        def explicit_true_false(value)
          raise ArgumentError unless value.to_s =~ /^(?:[01tf]|true|false)$/
        end

      end
    end
  end
end
