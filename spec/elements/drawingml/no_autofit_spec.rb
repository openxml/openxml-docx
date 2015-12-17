require "spec_helper"

describe OpenXml::DrawingML::Elements::NoAutofit do
  include ElementTestMacros

  it_should_use tag: :noAutofit, name: "no_autofit"

end
