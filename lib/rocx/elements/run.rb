module Rocx
  module Elements
    class Run < BaseContainer
      tag_name :r
      namespace :w
      properties_tag :rPr
      value_property :italics
      value_property :bold

    end
  end
end
