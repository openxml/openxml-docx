require "spec_helper"

describe OpenXml::Docx::Elements::PageNumber do
  include ElementTestMacros

  it_should_use tag: :pgNum, name: "page_number"

  with_no_attributes_set do
    it_should_output "<w:pgNum/>", assign: false
  end

end
