require "spec_helper"

describe OpenXml::Docx::Properties::Kerning do
  include ValuePropertyTestMacros

  it_should_use tag: :kern, name: "kerning", value: 22

  with_value(20) do
    it_should_work
    it_should_output "<w:kern w:val=\"20\"/>"
  end

  with_value(-20) do
    it_should_not_work
  end

  with_value(23.1) do
    it_should_not_work
  end

  with_value(:big) do
    it_should_not_work
  end
end
