require "spec_helper"

describe OpenXml::DrawingML::Elements::NoFill do
  include ElementTestMacros

  it_should_use tag: :noFill, name: "no_fill"

end
