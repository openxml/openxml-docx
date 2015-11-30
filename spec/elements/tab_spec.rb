require "spec_helper"

describe OpenXml::Docx::Elements::Tab do
  include ElementTestMacros

  it_should_use tag: :tab, name: "tab"

  with_no_attributes_set do
    it_should_output "<w:tab/>", assign: false
  end

end
