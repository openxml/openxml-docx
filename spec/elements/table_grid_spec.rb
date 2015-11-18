require "spec_helper"

describe OpenXml::Docx::Elements::TableGrid do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @instance = described_class.new
      column = OpenXml::Docx::Elements::GridColumn.new
      column.w = 1
      instance << column
    end

    it_should_output_correct_xml
  end

end
