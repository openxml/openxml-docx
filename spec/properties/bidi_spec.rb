require "spec_helper"

describe OpenXml::Docx::Properties::Bidi do
  include ValuePropertyTestMacros

  it_should_use tag: :bidi, name: "bidi", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:bidi/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:bidi w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
