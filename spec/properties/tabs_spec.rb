require "spec_helper"

describe Rocx::Properties::Tabs do
  include PropertyTestMacros

  it_should_use tag: :tabs, name: "tabs"

  context "when trying to add tabs, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the tab to be added isn't a tab at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no tabs" do
    before(:each) do
      @instance = described_class.new
    end

    it "should not output any XML" do
      expect(xml(instance)).to eq("")
    end
  end

  context "when there are tabs" do
    before(:each) do
      @instance = described_class.new
      instance << Rocx::Properties::Tab.new(1234, :start)
      instance << Rocx::Properties::Tab.new(5678, :end, :heavy)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:tabs>\n    <w:tab w:pos=\"1234\" w:val=\"start\"/>\n    <w:tab w:pos=\"5678\" w:val=\"end\" w:leader=\"heavy\"/>\n  </w:tabs>")
    end
  end
end
