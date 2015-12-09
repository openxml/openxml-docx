require "spec_helper"

describe OpenXml::Docx::Properties::TableLayout do
  include ValuePropertyTestMacros

  it_should_use tag: :tblLayout, name: "table_layout", value: :autofit

  with_value(:autofit) do
    it_should_work
    it_should_output "<w:tblLayout w:val=\"autofit\"/>"
  end

  with_value(:fixed) do
    it_should_work
    it_should_output "<w:tblLayout w:val=\"fixed\"/>"
  end

  with_value(:nope) do
    it_should_not_work
  end

end
