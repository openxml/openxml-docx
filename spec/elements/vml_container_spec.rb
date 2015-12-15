require "spec_helper"

describe OpenXml::Docx::Elements::VmlContainer do
  include ElementTestMacros

  it_should_use tag: :pict, name: "vml_container"

  with_no_attributes_set do
    it_should_output "<w:pict/>", assign: false
  end
end
