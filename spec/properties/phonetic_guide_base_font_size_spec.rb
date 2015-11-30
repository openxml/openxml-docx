require "spec_helper"

describe OpenXml::Docx::Properties::PhoneticGuideBaseFontSize do
  include ValuePropertyTestMacros

  it_should_use tag: :hpsBaseText, name: "base_font_size", value: 1

  with_value(24) do
    it_should_work
    it_should_output "<w:hpsBaseText w:val=\"24\"/>"
  end

  with_value(-24) do
    it_should_not_work
  end

  with_value(:big) do
    it_should_not_work
  end

  with_value(23.3) do
    it_should_not_work
  end

end
