require "spec_helper"

describe OpenXml::Docx::Properties::KeepNext do
  include ValuePropertyTestMacros

  it_should_use tag: :keepNext, name: "keep_next", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:keepNext/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:keepNext w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
