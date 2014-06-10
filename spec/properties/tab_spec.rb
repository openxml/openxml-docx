require "spec_helper"

describe Rocx::Properties::Tab do
  include PropertyTestMacros

  it_should_use tag: :tab, name: "tab", value: [1234, :start]

  context "when assigning bad position values, it" do
    it "should raise an exception" do
      expect { @instance = described_class.new(:bad, :start) }.to raise_error(ArgumentError)
    end
  end

  context "when assigning bad type values, it" do
    it "should raise an exception" do
      expect { @instance = described_class.new(1234, :bad) }.to raise_error(ArgumentError)
    end
  end

  context "when assigniing bad leader values, it" do
    it "should raise an exception" do
      expect { @instance = described_class.new(1234, :clear, :bad) }.to raise_error(ArgumentError)
    end
  end

  context "with valid values, it" do
    before(:each) do
      @instance = described_class.new(1234, :start)
    end

    it "should return the right XML" do
      expect(xml(instance)).to eq("<w:tab w:pos=\"1234\" w:val=\"start\"/>")
    end
  end

  context "with valid values and a specified leader, it" do
    before(:each) do
      @instance = described_class.new(1234, :start, :dot)
    end

    it "should Return the right XML" do
      expect(xml(instance)).to eq("<w:tab w:pos=\"1234\" w:val=\"start\" w:leader=\"dot\"/>")
    end
  end
end
