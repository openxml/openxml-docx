require "spec_helper"

describe OpenXml::DrawingML::Elements::SolidFill do
  include ElementTestMacros

  it_should_use tag: :solidFill, name: "solid_fill"

end
