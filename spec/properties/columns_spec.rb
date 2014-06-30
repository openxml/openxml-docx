require "spec_helper"

describe Rocx::Properties::Columns do
  include PropertyTestMacros

  it_should_use tag: :cols, name: "columns"

  context "when trying to add columns, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the column to be added isn't a column at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no columns" do
    before(:each) do
      @instance = described_class.new
    end

    it "should not output any XML" do
      expect(xml(instance)).to eq("")
    end
  end

  context "when there are columns" do
    before(:each) do
      @instance = described_class.new
      instance << Rocx::Properties::Column.new(1234, 5678)
      instance << Rocx::Properties::Column.new(8765, 4321)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:cols>\n    <w:col w:space=\"1234\" w:w=\"5678\"/>\n    <w:col w:space=\"8765\" w:w=\"4321\"/>\n  </w:cols>")
    end
  end
end
