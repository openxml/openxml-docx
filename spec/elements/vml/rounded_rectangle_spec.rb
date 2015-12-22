require "spec_helper"

describe OpenXml::Vml::Elements::RoundedRectangle do
  include ElementTestMacros

  it_should_use tag: :roundrect, name: "rounded_rectangle"

  describe "Arc Size Attribute" do
    for_attribute(:arc_size ) do
      %w(50% 1% 9000f).each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect arcsize=\"#{allowed_value}\"/>"
        end
      end

      with_values([50, 2, "9000"]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Connector Type Attribute" do
    for_attribute(:connector_type) do
      %i(curved elbow none straight).each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:connectortype=\"#{allowed_value}\"/>"
        end
      end

      with_values([:funky, 5, "auto"]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "HR Align Attribute" do
    for_attribute(:hr_align) do
      %i(center left right).each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:hralign=\"#{allowed_value}\"/>"
        end
      end

      with_values([:justified, 4, "overThere"]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Inset Mode Attribute" do
    for_attribute(:inset_mode) do
      with_value(:auto) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:insetmode=\"auto\"/>"
      end

      with_value(:custom) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:insetmode=\"custom\"/>"
      end

      with_values([:left, "right", 0]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Coordinate-based Attributes" do
    good_coord_values = [ "100,100", "-100,-100", "100,-100", "100, 100", "-100, -100", "100, -100" ]
    bad_coord_values = [ "100 100", "x:10,y:10", :over_there ]

    for_attribute(:coordinate_origin) do
      good_coord_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect coordorigin=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_coord_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:coordinate_size) do
      good_coord_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect coordsize=\"#{allowed_value}\"/>"
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

    for_attribute(:chroma_key) do
      good_color_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect chromakey=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_color_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:fill_color) do
      good_color_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect fillcolor=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_color_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroke_color) do
      good_color_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect strokecolor=\"#{allowed_value}\"/>"
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

    for_attribute(:diagram_node_layout) do
      good_diagram_layout_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:dgmlayout=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_diagram_layout_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:diagram_node_recent_layout) do
      good_diagram_layout_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:dgmlayoutmru=\"#{allowed_value}\"/>"
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

    for_attribute(:diagram_node_kind) do
      good_integer_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:dgmnodekind=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_percent) do
      good_integer_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:hrpct=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:regroup_id) do
      good_integer_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:regroupid=\"#{allowed_value}\"/>"
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

    for_attribute(:bw_mode) do
      good_bw_mode_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:bwmode=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_bw_mode_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bw_normal) do
      good_bw_mode_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:bwnormal=\"#{allowed_value}\"/>"
        end
      end

      with_values(bad_bw_mode_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bw_pure) do
      good_bw_mode_values.each do |allowed_value|
        with_value(allowed_value) do
          it_should_assign_successfully
          it_should_output "<v:roundrect o:bwpure=\"#{allowed_value}\"/>"
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
        it_should_output "<v:roundrect alt=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:css_class) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect class=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:href) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect href=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:id) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect id=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:opacity) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect opacity=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroke_weight) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect strokeweight=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:style) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect style=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:target) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect target=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:title) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect title=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:wrap_coordinates) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect wrapcoords=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_bottom_color) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:borderbottomcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_left_color) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:borderleftcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_right_color) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:borderrightcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_top_color) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:bordertopcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:optional_string) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:spid=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:optional_number) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:spt=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "(Explicitly) True/False-based Attributes" do
    for_attribute(:filled) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect filled=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect filled=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:inset_pen) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect insetpen=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect insetpen=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:print) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect print=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect print=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:stroked) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect stroked=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect stroked=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:allow_in_cell) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:allowincell=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:allowincell=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:allow_overlap) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:allowoverlap=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:allowoverlap=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:bullet) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:bullet=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:bullet=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:button) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:button=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:button=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:clip) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:clip=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:clip=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:clip_to_wrap) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:cliptowrap=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:cliptowrap=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:double_click_notify) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:doubleclicknotify=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:doubleclicknotify=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:force_dash) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:forcedash=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:forcedash=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hr=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hr=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_no_shade) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hrnoshade=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hrnoshade=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hr_standard) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hrstd=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:hrstd=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:ole) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:ole=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:ole=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:ole_icon) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:oleicon=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:oleicon=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:hide_extra_handles) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:oned=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:oned=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:prefer_relative) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:preferrelative=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:preferrelative=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:user_drawn) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:userdrawn=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:userdrawn=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:user_hidden) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:userhidden=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<v:roundrect o:userhidden=\"false\"/>"
      end

      with_values([:nope, 0, "off"]) do
        it_should_raise_an_exception
      end
    end
  end

end
