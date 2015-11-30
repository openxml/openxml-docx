require "spec_helper"

describe OpenXml::Docx::Properties::Outline do
  include ValuePropertyTestMacros

  it_should_use tag: :outline, name: "outline"

  with_value(true) do
    it_should_work
    it_should_output "<w:outline w:val=\"true\"/>"
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
