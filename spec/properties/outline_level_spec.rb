require "spec_helper"

describe OpenXml::Docx::Properties::OutlineLevel do
  include ValuePropertyTestMacros

  it_should_use tag: :outlineLvl, name: "outline_level", value: 2

  with_value(:big) do
    it_should_not_work
  end

  with_value(-1) do
    it_should_not_work
  end

  with_value(2) do
    it_should_work
    it_should_output "<w:outlineLvl w:val=\"2\"/>"
  end
end
