require "spec_helper"

describe OpenXml::Vml::Elements::RoundedRectangle do
  include ElementTestMacros

  it_should_use tag: :roundrect, name: "rounded_rectangle"

  # Arc Size Attribute

  for_attribute(:arc_size, displays_as: :arcsize) do
    with_values(%w(50% 1% 9000f)) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([50, 2, "9000"]) do
      it_should_raise_an_exception
    end
  end


  # Connector Type Attribute

  for_attribute(:connector_type, displays_as: :connectortype, with_namespace: :o) do
    with_values(%i(curved elbow none straight)) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([:funky, 5, "auto"]) do
      it_should_raise_an_exception
    end
  end


  # HR Align Attribute

  for_attribute(:hr_align, displays_as: :hralign, with_namespace: :o) do
    with_values(%i(center left right)) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([:justified, 4, "overThere"]) do
      it_should_raise_an_exception
    end
  end


  # Inset Mode Attribute

  for_attribute(:inset_mode, displays_as: :insetmode, with_namespace: :o) do
    with_values(%i(auto custom)) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([:left, "right", 0]) do
      it_should_raise_an_exception
    end
  end


  # Coordinate-based Attributes

  good_coord_values = [ "100,100", "-100,-100", "100,-100", "100, 100", "-100, -100", "100, -100" ]
  bad_coord_values = [ "100 100", "x:10,y:10", :over_there ]

  for_attribute(:coordinate_origin, displays_as: :coordorigin) do
    with_values(good_coord_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_coord_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:coordinate_size, displays_as: :coordsize) do
    with_values(good_coord_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_coord_values) do
      it_should_raise_an_exception
    end
  end


  # Color-based Attributes

  good_color_values = [ "#FFFFFF", :red, "palateEntry [0]", "palateEntry" ]
  bad_color_values = [ 54, 0 ]

  for_attribute(:chroma_key, displays_as: :chromakey) do
    with_values(good_color_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_color_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:fill_color, displays_as: :fillcolor) do
    with_values(good_color_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_color_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:stroke_color, displays_as: :strokecolor) do
    with_values(good_color_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_color_values) do
      it_should_raise_an_exception
    end
  end


  # Diagram Layout-based Attributes

  good_diagram_layout_values = (0..3)
  bad_diagram_layout_values = [ -1, 4, "Five is Right Out" ]

  for_attribute(:diagram_node_layout, displays_as: :dgmlayout, with_namespace: :o) do
    with_values(good_diagram_layout_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_diagram_layout_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:diagram_node_recent_layout, displays_as: :dgmlayoutmru, with_namespace: :o) do
    with_values(good_diagram_layout_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_diagram_layout_values) do
      it_should_raise_an_exception
    end
  end


  # Integer-based Attributes

  good_integer_values = [1, -1, 0]
  bad_integer_values = [2.5, :five, "five"]

  for_attribute(:diagram_node_kind, displays_as: :dgmnodekind, with_namespace: :o) do
    with_values(good_integer_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_integer_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hr_percent, displays_as: :hrpct, with_namespace: :o) do
    with_values(good_integer_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_integer_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:regroup_id, displays_as: :regroupid, with_namespace: :o) do
    with_values(good_integer_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_integer_values) do
      it_should_raise_an_exception
    end
  end


  # Black and White Mode-based Attributes

  good_bw_mode_values = %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
  bad_bw_mode_values = [:paintItBlack, 0, "rainbows"]

  for_attribute(:bw_mode, displays_as: :bwmode, with_namespace: :o) do
    with_values(good_bw_mode_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_bw_mode_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bw_normal, displays_as: :bwnormal, with_namespace: :o) do
    with_values(good_bw_mode_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_bw_mode_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bw_pure, displays_as: :bwpure, with_namespace: :o) do
    with_values(good_bw_mode_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_bw_mode_values) do
      it_should_raise_an_exception
    end
  end


  # String-based Attributes

  good_string_values = ["A String", "AnotherString", "000001f"]
  bad_string_values = [0, :nope, false]

  for_attribute(:alt) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:css_class, displays_as: :class) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:href) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:opacity) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:stroke_weight, displays_as: :strokeweight) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:style) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:target) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:title) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap_coordinates, displays_as: :wrapcoords) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:border_bottom_color, displays_as: :borderbottomcolor, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:border_left_color, displays_as: :borderleftcolor, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:border_right_color, displays_as: :borderrightcolor, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:border_top_color, displays_as: :bordertopcolor, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:optional_string, displays_as: :spid, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:optional_number, displays_as: :spt, with_namespace: :o) do
    with_values(good_string_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_string_values) do
      it_should_raise_an_exception
    end
  end


  # (Explicitly) True/False-based Attributes

  good_tf_values = %w(0 1 t f true false)
  bad_tf_values = ["yes", "no", "on", "off", 5]

  for_attribute(:filled) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:inset_pen, displays_as: :insetpen) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:print) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:stroked) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:allow_in_cell, displays_as: :allowincell, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:allow_overlap, displays_as: :allowoverlap, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bullet, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:button, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:clip, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:clip_to_wrap, displays_as: :cliptowrap, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:double_click_notify, displays_as: :doubleclicknotify, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:force_dash, displays_as: :forcedash, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hr, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hr_no_shade, displays_as: :hrnoshade, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hr_standard, displays_as: :hrstd, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:ole, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:ole_icon, displays_as: :oleicon, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hide_extra_handles, displays_as: :oned, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:prefer_relative, displays_as: :preferrelative, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:user_drawn, displays_as: :userdrawn, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:user_hidden, displays_as: :userhidden, with_namespace: :o) do
    with_values(good_tf_values) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(bad_tf_values) do
      it_should_raise_an_exception
    end
  end


end
