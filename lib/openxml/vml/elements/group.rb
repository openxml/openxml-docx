module OpenXml
  module Vml
    module Elements
      class Group < OpenXml::Docx::Elements::Container
        namespace :v

        attribute :alt, expects: :string
        attribute :css_class, expects: :string, displays_as: :class
        attribute :coordinate_origin, expects: :valid_coordinate, displays_as: :coordorigin
        attribute :coordinate_size, expects: :valid_coordinate, displays_as: :coordsize
        attribute :edit_as, one_of: %i(bullseye canvas cycle orgchart radial stacked venn), displays_as: :editas
        attribute :fill_color, expects: :valid_color, displays_as: :fillcolor
        attribute :filled, expects: :explicit_true_false
        attribute :href, expects: :string
        attribute :id, expects: :string
        attribute :print, expects: :explicit_true_false
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
          attribute :diagram_node_layout, expects: :valid_diagram_layout, displays_as: :dgmlayout
          attribute :diagram_node_recent_layout, expects: :valid_diagram_layout, displays_as: :dgmlayoutmru
          attribute :diagram_node_kind, expects: :integer, displays_as: :dgmnodekind
          attribute :double_click_notify, expects: :explicit_true_false, displays_as: :doubleclicknotify
          attribute :hr, expects: :explicit_true_false
          attribute :hr_align, expects: :valid_hr_align, displays_as: :hralign
          attribute :hr_no_shade, expects: :explicit_true_false, displays_as: :hrnoshade
          attribute :hr_percent, expects: :integer, displays_as: :hrpct
          attribute :hr_standard, expects: :explicit_true_false, displays_as: :hrstd
          attribute :inset_mode, expects: :valid_inset_mode, displays_as: :insetmode
          attribute :hide_extra_handles, expects: :explicit_true_false, displays_as: :oned
          attribute :regroup_id, expects: :integer, displays_as: :regroupid
          attribute :optional_string, expects: :string, displays_as: :spid
          attribute :table_limits, expects: :string, displays_as: :tablelimits
          attribute :table_properties, expects: :string, displays_as: :tableproperties
          attribute :user_drawn, expects: :explicit_true_false, displays_as: :userdrawn
          attribute :user_hidden, expects: :explicit_true_false, displays_as: :userhidden
        end

      private

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

        def explicit_true_false(value)
          raise ArgumentError unless value.to_s =~ /^(?:[01tf]|true|false)$/
        end

      end
    end
  end
end
