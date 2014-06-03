module Rocx
  module Elements
    class Run < BaseContainer
      tag_name :r
      namespace :w
      properties_tag :rPr

      value_property :bold
      value_property :caps
      value_property :complex_bold
      value_property :italics
      value_property :snap_to_grid

      property :border
      property :color
      property :shading

    end
  end
end
