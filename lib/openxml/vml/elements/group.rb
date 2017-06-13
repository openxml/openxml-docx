module OpenXml
  module Vml
    module Elements
      class Group < Element
        include HasChildren

        namespace :v

        attribute :alt, expects: :string
        attribute :css_class, expects: :string, displays_as: :class
        attribute :coordinate_origin, matches: /^[\-0-9]+,\s?[\-0-9]+$/, displays_as: :coordorigin
        attribute :coordinate_size, matches: /^[\-0-9]+,\s?[\-0-9]+$/, displays_as: :coordsize
        attribute :edit_as, one_of: %i(bullseye canvas cycle orgchart radial stacked venn), displays_as: :editas
        attribute :fill_color, expects: :valid_color, displays_as: :fillcolor
        attribute :filled, expects: :boolean
        attribute :href, expects: :string
        attribute :id, expects: :string
        attribute :print, expects: :boolean
        attribute :style, expects: :string
        attribute :target, expects: :string
        attribute :title, expects: :string
        attribute :wrap_coordinates, expects: :string, displays_as: :wrapcoords

        with_namespace :o do
          attribute :allow_in_cell, expects: :boolean, displays_as: :allowincell
          attribute :allow_overlap, expects: :boolean, displays_as: :allowoverlap
          attribute :border_bottom_color, expects: :string, displays_as: :borderbottomcolor
          attribute :border_left_color, expects: :string, displays_as: :borderleftcolor
          attribute :border_right_color, expects: :string, displays_as: :borderrightcolor
          attribute :border_top_color, expects: :string, displays_as: :bordertopcolor
          attribute :bullet, expects: :boolean
          attribute :button, expects: :boolean
          attribute :diagram_node_layout, expects: :valid_diagram_layout, displays_as: :dgmlayout
          attribute :diagram_node_recent_layout, expects: :valid_diagram_layout, displays_as: :dgmlayoutmru
          attribute :diagram_node_kind, expects: :integer, displays_as: :dgmnodekind
          attribute :double_click_notify, expects: :boolean, displays_as: :doubleclicknotify
          attribute :hr, expects: :boolean
          attribute :hr_align, one_of: %i(center left right), displays_as: :hralign
          attribute :hr_no_shade, expects: :boolean, displays_as: :hrnoshade
          attribute :hr_percent, expects: :integer, displays_as: :hrpct
          attribute :hr_standard, expects: :boolean, displays_as: :hrstd
          attribute :inset_mode, one_of: %i(auto custom), displays_as: :insetmode
          attribute :hide_extra_handles, expects: :boolean, displays_as: :oned
          attribute :regroup_id, expects: :integer, displays_as: :regroupid
          attribute :optional_string, expects: :string, displays_as: :spid
          attribute :table_limits, expects: :string, displays_as: :tablelimits
          attribute :table_properties, expects: :string, displays_as: :tableproperties
          attribute :user_drawn, expects: :boolean, displays_as: :userdrawn
          attribute :user_hidden, expects: :boolean, displays_as: :userhidden
        end

      private

        def valid_color(value)
          ok_color_names = %i(black silver gray white maroon red purple fuchsia green lime olive yellow navy blue teal aqua)
          valid_hex = /#[0-9a-f]{6}/i
          valid_palette_entry = /^\w+(?:\s\[[0-9]+\])?$/
          message = "Invalid color. Please specify a color name, a hex value (with #), or a palette entry."
          raise ArgumentError, message unless ok_color_names.include?(value) || value =~ valid_hex || value =~ valid_palette_entry
        end

        def valid_diagram_layout(value)
          message = "Invalid diagram layout. Must be a single digit between 0 and 3 inclusive"
          raise ArgumentError, message unless (value.is_a?(Fixnum) && (0..3).include?(value)) || value =~ /^[0-3]$/
        end

      end
    end
  end
end
