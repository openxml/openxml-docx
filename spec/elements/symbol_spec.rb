require "spec_helper"

describe Rocx::Elements::Symbol do
  include ElementTestMacros

  context "always" do
    before(:each) do
      @node = described_class.new
    end

    it "should raise an exception if the char property isn't a 4-digit hex" do
      expect { node.char = "not valid" }.to raise_error(ArgumentError)
      expect { node.char = "43fd" }.to_not raise_error
    end
  end

  context "with valid attributes" do
    before(:each) do
      @node = described_class.new(char: "43fd", font: "Wingdings")
    end

    it_should_output_correct_xml
  end
end
