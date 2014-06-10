require "spec_helper"

describe Rocx::Elements::Text do
  include ElementTestMacros

  context "for the space attribute" do
    it "shoudl require space to be :preserve or nil" do
      expect { described_class.new("Banana", space: :preserve) }.to_not raise_error

      expect { described_class.new("Banana") }.to_not raise_error

      expect { described_class.new("Banana", space: :the_final_frontier) }.to raise_error(ArgumentError)
    end
  end

  context "with valid attributes" do
    before(:each) do
      @node = described_class.new("Banana", space: :preserve)
    end

    it_should_output_correct_xml
  end
end
