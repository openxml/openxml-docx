require "spec_helper"

describe OpenXml::Docx::Properties::TableCellBorders do
  include PropertyTestMacros

  it_should_use tag: :tcBorders, name: "table_cell_borders"

  context "when trying to add cell borders, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the cell border to be added isn't a cell border at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no cell borders" do
    before(:each) do
      @instance = described_class.new
    end

    it "should not output any XML" do
      expect(xml(instance)).to eq("")
    end
  end

  context "when there are borders" do
    before(:each) do
      @instance = described_class.new
      instance << OpenXml::Docx::Properties::TableCellBorder.new(:start, :babyPacifier)
      instance << OpenXml::Docx::Properties::TableCellBorder.new(:end, :babyPacifier)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:tcBorders>\n    <w:start w:val=\"babyPacifier\"/>\n    <w:end w:val=\"babyPacifier\"/>\n  </w:tcBorders>")
    end
  end

end
