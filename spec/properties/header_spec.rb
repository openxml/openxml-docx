require "spec_helper"

describe OpenXml::Docx::Properties::Header do
  include ValuePropertyTestMacros

  it_should_use tag: :header, name: "header", value: "Something"

  with_value("Something Else") do
    it_should_work
    it_should_output "<w:header w:val=\"Something Else\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
