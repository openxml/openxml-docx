require "spec_helper"

describe OpenXml::Docx::Elements::Drawing do
  include ElementTestMacros

  it_should_use tag: :drawing, name: "drawing"

  with_no_attributes_set do
    it_should_output "<w:drawing/>", assign: false
  end

  it_should_scaffold_itself_correctly

end
