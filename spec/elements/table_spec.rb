require "spec_helper"

describe OpenXml::Docx::Elements::Table do
  include ElementTestMacros

  it_should_use tag: :tbl, name: "table"

  before(:each) do
    @instance = described_class.new
    instance.cant_split = true
    row = OpenXml::Docx::Elements::TableRow.new
    row.hidden = true
    cell = OpenXml::Docx::Elements::TableCell.new
    cell.no_wrap = true
    row << cell
    instance << row
  end

  it_should_output_correct_xml
  it_should_scaffold_itself_correctly

end
