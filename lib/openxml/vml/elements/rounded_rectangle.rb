module OpenXml
  module Vml
    module Elements
      class RoundedRectangle < OpenXml::Docx::Elements::Container
        namespace :v
        tag :roundrect

        attribute :alternate_text, expects: :string, displays_as: :alt
        attribute :arc_size, expects: :valid_arc_size, displays_as: :arcsize
        attribute :chroma_key, expects: :valid_color
        attribute :css_class, expects: :string
        attribute :coordinate_origin, expects: :valid_coordinate, displays_as: :coordorigin
        attribute :coordinate_size, expects: :valid_coordinate, displays_as: :coordsize
        attribute :fill_color, expects: :valid_color, displays_as: :fillcolor
        attribute :filled, expects: :true_or_false
        attribute :href, expects: :string
        attribute :id, expects: :string
        attribute :inset_pen, expects: :true_or_false, displays_as: :insetpen
        attribute :opacity, expects: :string # Can be a float or 1/65536ths when followed by `f`
        attribute :print, expects: :true_or_false
        attribute :stroke_color, expects: :valid_color
        attribute :stroked, expects: :true_or_false
        attribute :stroke_weight, expects: :string, displays_as: :strokeweight # Expects number with units
        attribute :style, expects: :string
        attribute :target, expects: :string
        attribute :title, expects: :string
        attribute :wrap_coordinates, expects: :string, displays_as: :wrapcoords

        with_namespace :o do
          attribute :allow_in_cell, expects: :true_or_false, displays_as: :allowincell
          attribute :allow_overlap, expects: :true_or_false, displays_as: :allowoverlap
          attribute :border_bottom_color, expects: :string, displays_as: :borderbottomcolor
          attribute :border_left_color, expects: :string, displays_as: :borderleftcolor
          attribute :border_right_color, expects: :string, displays_as: :borderrightcolor
          attribute :border_top_color, expects: :string, displays_as: :bordertopcolor
          attribute :bullet, expects: :true_or_false
          attribute :button, expects: :true_or_false
          attribute :bw_mode, expects: :valid_bw_mode, displays_as: :bwmode
          attribute :bw_normal, expects: :valid_bw_mode, displays_as: :bwnormal
          attribute :bw_pure, expects: :valid_bw_mode, displays_as: :bwpure
          attribute :clip, expects: :true_or_false
          attribute :clip_to_wrap, expects: :true_or_false, displays_as: :cliptowrap
          attribute :connector_type, expects: :valid_connector_type, displays_as: :connectortype
          attribute :diagram_node_layout, expects: :valid_diagram_layout, displays_as: :dgmlayout
          attribute :diagram_node_recent_layout, expects: :valid_diagram_layout, displays_as: :dgmlayoutmru
          attribute :diagram_node_kind, expects: :integer, displays_as: :dgmnodekind
          attribute :double_click_notify, expects: :true_or_false, displays_as: :doubleclicknotify
          attribute :force_dash, expects: :true_or_false, displays_as: :forcedash
          attribute :hr, expects: :true_or_false
          attribute :hr_align, expects: :valid_hr_align, displays_as: :hralign
          attribute :hr_no_shade, expects: :true_or_false, displays_as: :hrnoshade
          attribute :hr_percent, expects: :integer, displays_as: :hrpct
          attribute :hr_standard, expects: :true_or_false, displays_as: :hrstd
          attribute :inset_mode, expects: :valid_inset_mode, displays_as: :insetmode
          attribute :ole, expects: :true_or_false
          attribute :ole_icon, expects: :true_or_false, displays_as: :oleicon
          attribute :hide_extra_handles, expects: :true_or_false, displays_as: :oned
          attribute :prefer_relative, expects: :true_or_false, displays_as: :preferrelative
          attribute :regroup_id, expects: :integer, displays_as: :regroupid
          attribute :optional_string, expects: :string, displays_as: :spid
          attribute :optional_number, expects: :string, displays_as: :spt # Actually expects float
          attribute :user_drawn, expects: :true_or_false, displays_as: :userdrawn
          attribute :user_hidden, expects: :true_or_false, displays_as: :userhidden
        end

      private

        def valid_arc_size(value)
          message = "Invalid arc size. Requires a percent or value in terms of f."
          raise ArgumentError, message unless value.is_a?(String) && value =~ /^[0-9]+[%f]$/
        end

        def valid_bw_mode(value)
          ok_values = %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
          message = "Invalid black and white mode (#{value}). Valid options are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_color(value)
          ok_color_names = %i(black silver gray white maroon red purple fuchsia green lime olive yellow navy blue teal aqua)
          valid_hex = /#[0-9a-f]{6}/i
          valid_palette_entry = /^\w+(?:\s\[[0-9]+\])?$/
          message = "Invalid color. Please specify a color name, a hex value (with #), or a palette entry."
          raise ArgumentError, message unless ok_color_names.include?(value) || value =~ valid_hex || value =~ valid_palette_entry
        end

        def valid_connector_type(value)
          ok_values = %i(curved elbow none straight)
          message = "Invalid connector type (#{value}). Valid types are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_coordinate(value)
          raise ArgumentError, "Invalid coordinates." unless value =~ /^[\-0-9]+,\s?[\-0-9]+$/
        end

        def valid_diagram_layout(value)
          message = "Invalid diagram layout. Must be a single digit between 0 and 3 inclusive"
          raise ArgumentError, message unless (value.is_a?(Fixnum) && (0..3).include?(value)) || value =~ /^[0-3]$/
        end

        def valid_hr_align(value)
          ok_values = %i(center left right)
          message = "Invalid hr alignment (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_inset_mode(value)
          ok_values = %i(auto custom)
          message = "Invalid inset mode (#{value}). Valid modes are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

      end
    end
  end
end
