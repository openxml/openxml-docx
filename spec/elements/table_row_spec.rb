require "spec_helper"

describe OpenXml::Docx::Elements::TableRow do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @instance = described_class.new
      instance.hidden = true
      cell = OpenXml::Docx::Elements::TableCell.new
      cell.no_wrap = true
      instance << cell
    end

    it_should_output_correct_xml
  end

end
