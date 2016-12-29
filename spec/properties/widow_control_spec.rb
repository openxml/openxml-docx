require "spec_helper"

describe OpenXml::Docx::Properties::WidowControl do
  include ValuePropertyTestMacros

  it_should_use tag: :widowControl, name: "widow_control", value: true

  with_value(:on) do
    it_should_work
    it_should_output "<w:widowControl w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:widowControl w:val=\"off\"/>"
  end

  with_value(true) do
    it_should_work
    it_should_output "<w:widowControl/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:widowControl w:val=\"false\"/>"
  end


  with_value(nil) do
    it_should_not_work
  end

end
