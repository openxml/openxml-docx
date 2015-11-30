require "spec_helper"

describe OpenXml::Docx::Properties::AutoSpaceDe do
  include ValuePropertyTestMacros

  it_should_use tag: :autoSpaceDE, name: "auto_space_de"

  with_value(true) do
    it_should_work
    it_should_output "<w:autoSpaceDE w:val=\"true\"/>"
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
