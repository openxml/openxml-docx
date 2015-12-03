require "spec_helper"

describe OpenXml::Docx::Elements::VmlObject do
  include ElementTestMacros

  it_should_use tag: :pict, name: "vml_object"

  with_no_attributes_set do
    it_should_output "<w:pict/>", assign: false
  end
end
