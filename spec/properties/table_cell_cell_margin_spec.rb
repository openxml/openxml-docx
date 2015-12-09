require "spec_helper"

describe OpenXml::Docx::Properties::TableCellCellMargin do
  include PropertyTestMacros

  it_should_use tag: :tcMar, name: "table_cell_cell_margin"

  context "when trying to add table cell margins, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the margin to be added isn't a margin at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no margins" do
    before(:each) do
      @instance = described_class.new
    end

    it "should not output any XML" do
      expect(xml(instance)).to eq("")
    end
  end

  context "when there are margins" do
    before(:each) do
      @instance = described_class.new
      start_margin = OpenXml::Docx::Properties::TableCellMargin.new(:start)
      end_margin = OpenXml::Docx::Properties::TableCellMargin.new(:end)
      start_margin.type = :dxa
      start_margin.width = 1
      end_margin.type = :dxa
      end_margin.width = 1
      instance << start_margin
      instance << end_margin
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:tcMar>\n    <w:start w:type=\"dxa\" w:w=\"1\"/>\n    <w:end w:type=\"dxa\" w:w=\"1\"/>\n  </w:tcMar>")
    end
  end

end
