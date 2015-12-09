require "spec_helper"

describe OpenXml::Docx::Properties::TableBorders do
  include PropertyTestMacros

  it_should_use tag: :tblBorders, name: "table_borders"

  context "when trying to add borders, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the border to be added isn't a border at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no borders" do
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
      instance << OpenXml::Docx::Properties::TableBorder.new(:start, :babyPacifier)
      instance << OpenXml::Docx::Properties::TableBorder.new(:end, :babyPacifier)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:tblBorders>\n    <w:start w:val=\"babyPacifier\"/>\n    <w:end w:val=\"babyPacifier\"/>\n  </w:tblBorders>")
    end
  end

end

