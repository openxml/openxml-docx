require "spec_helper"

describe OpenXml::Vml::Elements::Shape do
  include ElementTestMacros

  it_should_use tag: :shape, name: "shape"

  for_attribute(:adjustments, displays_as: :adj) do
    with_value("Valid String") do
      it_should_assign_successfully
      it_should_output "<v:shape adj=\"Valid String\"/>"
    end

    with_values([1, :not_a_string]) do
      it_should_raise_an_exception
    end
  end

  describe "Connector Type Attribute" do
    for_attribute(:connector_type, displays_as: :connectortype, with_namespace: :o) do
      %i(curved elbow none straight).each do |value|
        with_value(value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:connectortype=\"#{value}\"/>"
        end
      end

      with_values([:funky, 5, "auto"]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "HR Align Attribute" do
    for_attribute(:hr_align, displays_as: :hralign, with_namespace: :o) do
      %i(center left right).each do |value|
        with_value(value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:hralign=\"#{value}\"/>"
        end
      end

      with_values([:justified, 4, "overThere"]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Inset Mode Attribute" do
    for_attribute(:inset_mode, displays_as: :insetmode, with_namespace: :o) do
      with_value(:auto) do
        it_should_assign_successfully
        it_should_output "<v:shape o:insetmode=\"auto\"/>"
      end

      with_value(:custom) do
        it_should_assign_successfully
        it_should_output "<v:shape o:insetmode=\"custom\"/>"
      end

      with_values([:left, "right", 0]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Coordinate-based Attributes" do
    good_coord_values = [ "100,100", "-100,-100", "100,-100", "100, 100", "-100, -100", "100, -100" ]
    bad_coord_values = [ "100 100", "x:10,y:10", :over_there ]

    for_attribute(:coordinate_origin, displays_as: :coordorigin) do
      good_coord_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape coordorigin=\"#{good_value}\"/>"
        end
      end

      with_values(bad_coord_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:coordinate_size, displays_as: :coordsize) do
      good_coord_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape coordsize=\"#{good_value}\"/>"
        end
      end

      with_values(bad_coord_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Color-based Attributes" do
    good_color_values = [ "#FFFFFF", :red, "palateEntry [0]", "palateEntry" ]
    bad_color_values = [ 54, 0 ]

    for_attribute(:chroma_key, displays_as: :chromakey) do
      good_color_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape chromakey=\"#{good_value}\"/>"
        end
      end

      with_values(bad_color_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:fill_color, displays_as: :fillcolor) do
      good_color_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape fillcolor=\"#{good_value}\"/>"
        end
      end

      with_values(bad_color_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroke_color, displays_as: :strokecolor) do
      good_color_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape strokecolor=\"#{good_value}\"/>"
        end
      end

      with_values(bad_color_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Diagram Layout-based Attributes" do
    good_diagram_layout_values = (0..3)
    bad_diagram_layout_values = [ -1, 4, "Five is Right Out" ]

    for_attribute(:diagram_node_layout, displays_as: :dgmlayout, with_namespace: :o) do
      good_diagram_layout_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:dgmlayout=\"#{good_value}\"/>"
        end
      end

      with_values(bad_diagram_layout_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:diagram_node_recent_layout, displays_as: :dgmlayoutmru, with_namespace: :o) do
      good_diagram_layout_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:dgmlayoutmru=\"#{good_value}\"/>"
        end
      end

      with_values(bad_diagram_layout_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Integer-based Attributes" do
    good_integer_values = [1, -1, 0]
    bad_integer_values = [2.5, :five, "five"]

    for_attribute(:diagram_node_kind, displays_as: :dgmnodekind, with_namespace: :o) do
      good_integer_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:dgmnodekind=\"#{good_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_percent, displays_as: :hrpct, with_namespace: :o) do
      good_integer_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:hrpct=\"#{good_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:regroup_id, displays_as: :regroupid, with_namespace: :o) do
      good_integer_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:regroupid=\"#{good_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Black and White Mode-based Attributes" do
    good_bw_mode_values = %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white)
    bad_bw_mode_values = [:paintItBlack, 0, "rainbows"]

    for_attribute(:bw_mode, displays_as: :bwmode, with_namespace: :o) do
      good_bw_mode_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:bwmode=\"#{good_value}\"/>"
        end
      end

      with_values(bad_bw_mode_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bw_normal, displays_as: :bwnormal, with_namespace: :o) do
      good_bw_mode_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:bwnormal=\"#{good_value}\"/>"
        end
      end

      with_values(bad_bw_mode_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bw_pure, displays_as: :bwpure, with_namespace: :o) do
      good_bw_mode_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:bwpure=\"#{good_value}\"/>"
        end
      end

      with_values(bad_bw_mode_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "String-based Attributes" do
    bad_string_values = [0, :nope, false]

    for_attribute(:alt) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape alt=\"String\"/>"
      end

      with_value("000001f") do
        it_should_assign_successfully
        it_should_output "<v:shape alt=\"000001f\"/>"
      end


      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:css_class, displays_as: :class) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape class=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:href) do
      with_value("http://something.com") do
        it_should_assign_successfully
        it_should_output "<v:shape href=\"http://something.com\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:id) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape id=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:opacity) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape opacity=\"String\"/>"
      end

      with_value("0.5") do
        it_should_assign_successfully
        it_should_output "<v:shape opacity=\"0.5\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroke_weight, displays_as: :strokeweight) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape strokeweight=\"String\"/>"
      end

      with_value("000001f") do
        it_should_assign_successfully
        it_should_output "<v:shape strokeweight=\"000001f\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:style) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape style=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:target) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape target=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:title) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape title=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:wrap_coordinates, displays_as: :wrapcoords) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape wrapcoords=\"String\"/>"
      end

      with_value("0,0,100,100") do
        it_should_assign_successfully
        it_should_output "<v:shape wrapcoords=\"0,0,100,100\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_bottom_color, displays_as: :borderbottomcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape o:borderbottomcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_left_color, displays_as: :borderleftcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape o:borderleftcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_right_color, displays_as: :borderrightcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape o:borderrightcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_top_color, displays_as: :bordertopcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape o:bordertopcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:optional_string, displays_as: :spid, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:shape o:spid=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:optional_number, displays_as: :spt, with_namespace: :o) do
      with_value("NumberAsString") do
        it_should_assign_successfully
        it_should_output "<v:shape o:spt=\"NumberAsString\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "(Explicitly) True/False-based Attributes" do
    good_tf_values = [true, false]
    bad_tf_values = ["yes", "no", "on", "off", 5]

    for_attribute(:filled) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape filled=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:inset_pen, displays_as: :insetpen) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape insetpen=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:print) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape print=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroked) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape stroked=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:allow_in_cell, displays_as: :allowincell, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:allowincell=\"#{good_value}\"/>"
        end
      end
      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:allow_overlap, displays_as: :allowoverlap, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:allowoverlap=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bullet, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:bullet=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:button, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:button=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:clip, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:clip=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:clip_to_wrap, displays_as: :cliptowrap, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:cliptowrap=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:double_click_notify, displays_as: :doubleclicknotify, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:doubleclicknotify=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:force_dash, displays_as: :forcedash, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:forcedash=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:hr=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_no_shade, displays_as: :hrnoshade, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:hrnoshade=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_standard, displays_as: :hrstd, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:hrstd=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:ole, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:ole=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:ole_icon, displays_as: :oleicon, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:oleicon=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hide_extra_handles, displays_as: :oned, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:oned=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:prefer_relative, displays_as: :preferrelative, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:preferrelative=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:user_drawn, displays_as: :userdrawn, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:userdrawn=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:user_hidden, displays_as: :userhidden, with_namespace: :o) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:shape o:userhidden=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end
  end

end
