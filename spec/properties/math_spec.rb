require "spec_helper"

describe OpenXml::Docx::Properties::Math do
  include ValuePropertyTestMacros

  it_should_use tag: :oMath, name: "math", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:oMath/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:oMath w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
