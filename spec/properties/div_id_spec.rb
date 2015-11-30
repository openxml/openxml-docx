require "spec_helper"

describe OpenXml::Docx::Properties::DivId do
  include ValuePropertyTestMacros

  it_should_use tag: :divId, name: "div_id", value: 1

  with_value(2) do
    it_should_work
    it_should_output "<w:divId w:val=\"2\"/>"
  end

  with_value(:big) do
    it_should_not_work
  end

end
