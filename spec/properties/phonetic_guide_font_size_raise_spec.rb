require "spec_helper"

describe OpenXml::Docx::Properties::PhoneticGuideFontSizeRaise do
  include ValuePropertyTestMacros

  it_should_use tag: :hpsRaise, name: "font_size_raise", value: 1

  with_value(24) do
    it_should_work
    it_should_output "<w:hpsRaise w:val=\"24\"/>"
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
