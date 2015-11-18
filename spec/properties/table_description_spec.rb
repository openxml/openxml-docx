require "spec_helper"

describe OpenXml::Docx::Properties::TableDescription do
  include ValuePropertyTestMacros

  it_should_use tag: :tblDescription, name: "table_description", value: "Something"

  with_value("Something Else") do
    it_should_work
    it_should_output "<w:tblDescription w:val=\"Something Else\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
