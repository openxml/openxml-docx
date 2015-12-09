require "spec_helper"

describe OpenXml::Docx::Properties::TableCaption do
  include ValuePropertyTestMacros

  it_should_use tag: :tblCaption, name: "table_caption", value: "Something"

  with_value("Something Else") do
    it_should_work
    it_should_output "<w:tblCaption w:val=\"Something Else\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
