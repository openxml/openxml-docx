require "spec_helper"

describe OpenXml::DrawingML::Elements::WordprocessingShapeGroup do
  include ElementTestMacros

  it_should_use tag: :wgp, name: "wordprocessing_shape_group"

  with_no_attributes_set do
    it_should_output "<wpg:wgp/>", assign: false
  end

end
