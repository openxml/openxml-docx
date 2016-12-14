require "spec_helper"

describe OpenXml::Docx::Properties::Italics do
  include ValuePropertyTestMacros

  it_should_use tag: :i, name: "italics", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:i/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:i w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
