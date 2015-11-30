require "spec_helper"

describe OpenXml::Docx::Elements::ShortMonth do
  include ElementTestMacros

  it_should_use tag: :monthShort, name: "short_month"

  with_no_attributes_set do
    it_should_output "<w:monthShort/>", assign: false
  end

end
