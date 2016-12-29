require "spec_helper"

describe OpenXml::Docx::Properties::RightToLeft do
  include ValuePropertyTestMacros

  it_should_use tag: :rtl, name: "right_to_left", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:rtl/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:rtl w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
