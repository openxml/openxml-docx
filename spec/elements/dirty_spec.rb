require "spec_helper"

describe OpenXml::Docx::Elements::Dirty do
  include ElementTestMacros

  it_should_use tag: :dirty, name: "dirty"

  with_no_attributes_set do
    it_should_output "<w:dirty/>", assign: false
  end

end
