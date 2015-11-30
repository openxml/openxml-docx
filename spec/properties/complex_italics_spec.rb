require "spec_helper"

describe OpenXml::Docx::Properties::ComplexItalics do
  include ValuePropertyTestMacros

  it_should_use tag: :iCs, name: "complex_italics"

  with_value(true) do
    it_should_work
    it_should_output "<w:iCs/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
