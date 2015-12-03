require "spec_helper"

describe OpenXml::Docx::Elements::SectionProperties do
  include ElementTestMacros

  it_should_use tag: :sectPr, name: "section_properties"

  with_no_attributes_set do
    it_should_output "<w:sectPr/>", assign: false
  end

end
