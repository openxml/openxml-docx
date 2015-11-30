require "spec_helper"

describe OpenXml::Docx::Elements::ShortDay do
  include ElementTestMacros

  it_should_use tag: :dayShort, name: "short_day"

  with_no_attributes_set do
    it_should_output "<w:dayShort/>", assign: false
  end

end
