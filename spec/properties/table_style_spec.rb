require "spec_helper"

describe OpenXml::Docx::Properties::TableStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :tblStyle, name: "table_style", value: "Something"

  with_value("Something Else") do
    it_should_work
    it_should_output "<w:tblStyle w:val=\"Something Else\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
