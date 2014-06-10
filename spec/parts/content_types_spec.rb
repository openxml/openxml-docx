require "spec_helper"

describe Rocx::Parts::ContentTypes do
  include PartTestMacros

  context "when first creating the content types" do
    before(:each) do
      @doc = described_class.new
    end

    it "should install the preset defaults" do
      expect(doc.defaults.length).to eq(3)
    end

    it "should install the present overrides" do
      expect(doc.overrides.length).to eq(2)
    end
  end

  context "after creating the content types" do
    before(:each) do
      @doc = described_class.new
    end

    it "should be able to add additional defaults" do
      doc.default "coolml", "text/coolml"
      expect(doc.defaults).to include({"Extension" => "coolml", "ContentType" => "text/coolml"})
    end

    it_should_output_correct_xml
  end
end
