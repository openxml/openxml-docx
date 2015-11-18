require "spec_helper"

describe OpenXml::Docx::Properties::Headers do
  include PropertyTestMacros

  it_should_use tag: :headers, name: "headers"

  context "when trying to add headers, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the header to be added isn't a header at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no headers" do
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
      instance << OpenXml::Docx::Properties::Header.new("Something")
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:headers>\n    <w:header w:val=\"Something\"/>\n  </w:headers>")
    end
  end

end
