require "spec_helper"

describe OpenXml::Docx::Properties::TableOverlap do
  include ValuePropertyTestMacros

  it_should_use tag: :tblOverlap, name: "table_overlap", value: :never

  with_value(:never) do
    it_should_work
    it_should_output "<w:tblOverlap w:val=\"never\"/>"
  end

  with_value(:overlap) do
    it_should_work
    it_should_output "<w:tblOverlap w:val=\"overlap\"/>"
  end

  with_value(:nope) do
    it_should_not_work
  end

end
