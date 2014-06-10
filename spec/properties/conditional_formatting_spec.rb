require "spec_helper"

describe Rocx::Properties::ConditionalFormatting do
  include PropertyTestMacros

  it_should_use tag: :cnfStyle, name: "conditional_formatting"

  context "when trying to set an invalid attribute" do
    it "should raise an exception" do
      expect { described_class.new(bad: true) }.to raise_error(ArgumentError)
    end
  end

  context "when trying to set an invalid value to a valid attribute" do
    it "should raise an exception" do
      expect { described_class.new(even_v: :bad) }.to raise_error(ArgumentError)
    end
  end

  context "with valid attributes and valid values" do
    before(:each) do
      @instance = described_class.new(first_row: true, first_column: true, first_row_first_column: true)
    end

    it_should_output "<w:cnfStyle w:first_column=\"true\" w:first_row=\"true\" w:first_row_first_column=\"true\"/>", assign: false
  end
end
