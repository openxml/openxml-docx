require "spec_helper"

describe OpenXml::DrawingML::Elements::Line do
  include ElementTestMacros

  it_should_use tag: :ln, name: "line"

end
