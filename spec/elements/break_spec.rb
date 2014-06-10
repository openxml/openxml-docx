require "spec_helper"

describe Rocx::Elements::Break do
  include ElementTestMacros

  context "when creating a new break" do
    it "should not accept invalid values for the clear property" do
      expect { described_class.new(clear: :obviouslyInvalid) }.to raise_error(ArgumentError)
    end

    it "should not accept invalid values for the break_type property" do
      expect { described_class.new(break_type: :invalidType) }.to raise_error(ArgumentError)
    end
  end

  context "after initial creation" do
    before(:each) do
      @node = described_class.new
    end

    it "should still not accept invalid values for the clear property" do
      node = described_class.new
      expect { node.clear = :invalid }.to raise_error(ArgumentError)
    end

    it "should still not accept invalid values for the break_type property" do
      node = described_class.new
      expect { node.break_type = :weird }.to raise_error(ArgumentError)
    end
  end

  context "when both properties are nil" do
    before(:each) do
      @node = described_class.new
    end

    it_should_output_correct_xml
  end

  context "when either of the properties isn't nil" do
    before(:each) do
      @node = described_class.new(break_type: :page, clear: :left)
    end

    it_should_output_correct_xml node_xml: "break_with_attributes"
  end
end
