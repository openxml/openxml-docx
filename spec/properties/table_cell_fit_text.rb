require "spec_helper"

describe OpenXml::Docx::Properties::TableCellFitText do
  include ValuePropertyTestMacros

  it_should_use tag: :tcFitText, name: "table_cell_fit_text"

  with_value(true) do
    it_should_work
    it_should_output "<w:tcFitText w:val=\"true\"/>"
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
