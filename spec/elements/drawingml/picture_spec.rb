require "spec_helper"

describe OpenXml::DrawingML::Elements::Picture do
  include ElementTestMacros

  it_should_use tag: :pic, name: "picture"

end
