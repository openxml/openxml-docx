require "spec_helper"

describe OpenXml::DrawingML::Elements::Picture do
  include ElementTestMacros

  it_should_use tag: :pic, name: "picture"

  it_should_scaffold_itself_correctly(image_rid: "rId5")

end
