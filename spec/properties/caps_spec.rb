require "spec_helper"

describe OpenXml::Docx::Properties::Caps do
  include ValuePropertyTestMacros

  it_should_use tag: :caps, name: "caps", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:caps/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:caps w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
