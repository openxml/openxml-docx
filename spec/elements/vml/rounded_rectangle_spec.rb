require "spec_helper"

describe OpenXml::Vml::Elements::RoundedRectangle do
  include ElementTestMacros

  it_should_use tag: :roundrect, name: "rounded_rectangle"

  coordinate_attrs = {
    coordinate_origin: { display: :coordorigin },
    coordinate_size: { display: :coordsize }
  }

  color_attrs = {
    chroma_key: { display: :chromakey },
    fill_color: { display: :fillcolor },
    stroke_color: { display: :strokecolor }
  }

  diagram_layout_attrs = {
    diagram_node_layout: { display: :dgmlayout, namespace: :o },
    diagram_node_recent_layout: { display: :dgmlayoutmru, namespace: :o }
  }

  integer_attrs = {
    diagram_node_kind: { display: :dgmnodekind, namespace: :o },
    hr_percent: { display: :hrpct, namespace: :o },
    regroup_id: { display: :regroupid, namespace: :o }
  }

  bw_mode_attrs = {
    bw_mode: { display: :bwmode, namespace: :o },
    bw_normal: { display: :bwnormal, namespace: :o },
    bw_pure: { display: :bwpure, namespace: :o }
  }

  string_attrs = {
    alternate_text: { display: :alt },
    css_class: { display: :class },
    href: { display: :href },
    id: { display: :id },
    opacity: { display: :opacity },
    stroke_weight: { display: :strokeweight },
    style: { display: :style },
    target: { display: :target },
    title: { display: :title },
    wrap_coordinates: { display: :wrapcoords },
    border_bottom_color: { display: :borderbottomcolor, namespace: :o },
    border_left_color: { display: :borderleftcolor, namespace: :o },
    border_right_color: { display: :borderrightcolor, namespace: :o },
    border_top_color: { display: :bordertopcolor, namespace: :o },
    optional_string: { display: :spid, namespace: :o },
    optional_number: { display: :spt, namespace: :o }
  }

  true_false_attrs = {
    filled: { display: :filled },
    inset_pen: { display: :insetpen },
    print: { display: :print },
    stroked: { display: :stroked },
    allow_in_cell: { display: :allowincell, namespace: :o },
    allow_overlap: { display: :allowoverlap, namespace: :o },
    bullet: { display: :bullet, namespace: :o },
    button: { display: :button, namespace: :o },
    clip: { display: :clip, namespace: :o },
    clip_to_wrap: { display: :cliptowrap, namespace: :o },
    double_click_notify: { display: :doubleclicknotify, namespace: :o },
    force_dash: { display: :forcedash, namespace: :o },
    hr: { display: :hr, namespace: :o },
    hr_no_shade: { display: :hrnoshade, namespace: :o },
    hr_standard: { display: :hrstd, namespace: :o },
    ole: { display: :ole, namespace: :o },
    ole_icon: { display: :oleicon, namespace: :o },
    hide_extra_handles: { display: :oned, namespace: :o },
    prefer_relative: { display: :preferrelative, namespace: :o },
    user_drawn: { display: :userdrawn, namespace: :o },
    user_hidden: { display: :userhidden, namespace: :o }
  }

  # One-off Attributes
  # ====================
  # No namespace
  #   attribute :arc_size, expects: :valid_arc_size, displays_as: :arcsize

  # Namespace :o
  #   attribute :connector_type, expects: :valid_connector_type, displays_as: :connectortype
  #   attribute :hr_align, expects: :valid_hr_align, displays_as: :hralign
  #   attribute :inset_mode, expects: :valid_inset_mode, displays_as: :insetmode

  attribute_clusters = [
    { attributes: coordinate_attrs,
      valid_values: [ "100,100", "-100,-100", "100,-100", "100, 100", "-100, -100", "100, -100" ],
      invalid_values: [ "100 100", "x:10,y:10", :over_there ] },
    { attributes: color_attrs,
      valid_values: [ "#FFFFFF", :red, "palateEntry [0]", "palateEntry" ],
      invalid_values: [ 54 ] },
    { attributes: diagram_layout_attrs,
      valid_values: (0..3),
      invalid_values: [4, :invalid, false] },
    { attributes: integer_attrs,
      valid_values: [1, -1, 0],
      invalid_values: [2.5, :five, "five"] },
    { attributes: bw_mode_attrs,
      valid_values: %i(auto black blackTextAndLines color grayOutline grayScale hide highContrast inverseGray lightGrayscale undrawn white),
      invalid_values: [:paintItBlack, 0, "rainbows"] },
    { attributes: string_attrs,
      valid_values: ["A String", "AnotherString", "000001f"],
      invalid_values: [0, :nope, false] },
    { attributes: true_false_attrs,
      valid_values: %w(0 1 t f true false),
      invalid_values: ["yes", "no", "on", "off", 5] },
    { attributes: { arc_size: { display: :arcsize } },
      valid_values: %w(50% 1% 9000f),
      invalid_values: [50, 2, "9000"] },
    { attributes: { connector_type: { display: :connectortype, namespace: :o } },
      valid_values: %i(curved elbow none straight),
      invalid_values: [:funky, 5, "auto"] },
    { attributes: { hr_align: { display: :hralign, namespace: :o} },
      valid_values: %i(center left right),
      invalid_values: [:justified, 4, "overThere"] },
    { attributes: { inset_mode: { display: :insetmode, namespace: :o } },
      valid_values: %i(auto custom),
      invalid_values: [:left, "right", 0] }]

  attribute_clusters.each do |cluster|
    attributes = cluster[:attributes]
    attributes.keys.each do |attr_name|
      for_attribute(attr_name) do
        cluster[:valid_values].each do |ok_value|
          display = attributes[attr_name][:display]
          display = "#{attributes[attr_name][:namespace]}:#{display}" unless attributes[attr_name][:namespace].nil?
          with_value(ok_value) do
            it_should_assign_successfully
            it_should_output "<v:roundrect #{display}=\"#{ok_value}\"/>"
          end
        end

        cluster[:invalid_values].each do |bad_value|
          with_value(bad_value) do
            it_should_raise_an_exception
          end
        end
      end
    end
  end

end
