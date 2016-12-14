require "spec_helper"

describe OpenXml::Docx::Properties::HiddenStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :hidden, name: "hidden_style", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:hidden/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:hidden w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
