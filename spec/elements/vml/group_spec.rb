require "spec_helper"

describe OpenXml::Vml::Elements::Group do
  include ElementTestMacros

  it_should_use tag: :group, name: "group"


  describe "HR Align Attribute" do
    for_attribute(:hr_align, displays_as: :hralign, with_namespace: :o) do
      %i(center left right).each do |value|
        with_value(value) do
          it_should_assign_successfully
          it_should_output "<v:group o:hralign=\"#{value}\"/>"
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
        it_should_output "<v:group o:insetmode=\"auto\"/>"
      end

      with_value(:custom) do
        it_should_assign_successfully
        it_should_output "<v:group o:insetmode=\"custom\"/>"
      end

      with_values([:left, "right", 0]) do
        it_should_raise_an_exception
      end
    end
  end

  describe "Edit As Attribute" do
    for_attribute(:edit_as, displays_as: :editas) do
      %i(bullseye canvas cycle orgchart radial stacked venn).each do |value|
        with_value(value) do
          it_should_assign_successfully
          it_should_output "<v:group editas=\"#{value}\"/>"
        end
      end

      with_values([:piechart, 4, "amazingGraph"]) do
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
          it_should_output "<v:group coordorigin=\"#{good_value}\"/>"
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
          it_should_output "<v:group coordsize=\"#{good_value}\"/>"
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

    for_attribute(:fill_color, displays_as: :fillcolor) do
      good_color_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:group fillcolor=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:dgmlayout=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:dgmlayoutmru=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:dgmnodekind=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:hrpct=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:regroupid=\"#{good_value}\"/>"
        end
      end

      with_values(bad_integer_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "String-based Attributes" do
    bad_string_values = [0, :nope, false]

    for_attribute(:alt) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group alt=\"String\"/>"
      end

      with_value("000001f") do
        it_should_assign_successfully
        it_should_output "<v:group alt=\"000001f\"/>"
      end


      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:css_class, displays_as: :class) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group class=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:href) do
      with_value("http://something.com") do
        it_should_assign_successfully
        it_should_output "<v:group href=\"http://something.com\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:id) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group id=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:style) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group style=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:target) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group target=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:title) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group title=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:wrap_coordinates, displays_as: :wrapcoords) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group wrapcoords=\"String\"/>"
      end

      with_value("0,0,100,100") do
        it_should_assign_successfully
        it_should_output "<v:group wrapcoords=\"0,0,100,100\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_bottom_color, displays_as: :borderbottomcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:borderbottomcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_left_color, displays_as: :borderleftcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:borderleftcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_right_color, displays_as: :borderrightcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:borderrightcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:border_top_color, displays_as: :bordertopcolor, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:bordertopcolor=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:optional_string, displays_as: :spid, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:spid=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:table_limits, displays_as: :tablelimits, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:tablelimits=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:table_properties, displays_as: :tableproperties, with_namespace: :o) do
      with_value("String") do
        it_should_assign_successfully
        it_should_output "<v:group o:tableproperties=\"String\"/>"
      end

      with_values(bad_string_values) do
        it_should_raise_an_exception
      end
    end
  end

  describe "(Explicitly) True/False-based Attributes" do
    good_tf_values = %w(0 1 t f true false)
    bad_tf_values = ["yes", "no", "on", "off", 5]

    for_attribute(:filled) do
      good_tf_values.each do |good_value|
        with_value(good_value) do
          it_should_assign_successfully
          it_should_output "<v:group filled=\"#{good_value}\"/>"
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
          it_should_output "<v:group print=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:allowincell=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:allowoverlap=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:bullet=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:button=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:doubleclicknotify=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:hr=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:hrnoshade=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:hrstd=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:oned=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:userdrawn=\"#{good_value}\"/>"
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
          it_should_output "<v:group o:userhidden=\"#{good_value}\"/>"
        end
      end

      with_values(bad_tf_values) do
        it_should_raise_an_exception
      end
    end
  end

end
