require "spec_helper"

describe OpenXml::Docx::Properties::AutoSpaceDn do
  include ValuePropertyTestMacros

  it_should_use tag: :autoSpaceDN, name: "auto_space_dn"

  with_value(true) do
    it_should_work
    it_should_output "<w:autoSpaceDN w:val=\"true\"/>"
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
