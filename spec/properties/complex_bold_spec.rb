require "spec_helper"

describe OpenXml::Docx::Properties::ComplexBold do
  include ValuePropertyTestMacros

  it_should_use tag: :bCs, name: "complex_bold", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:bCs/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:bCs w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
