require "spec_helper"

describe Rocx::Elements::Paragraph do
  include ElementTestMacros

  context "with runs" do
    before(:each) do
      @node = described_class.new
      node.indentation.start = 720
      node.indentation.end = -1440
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 1")
      node << run
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 2")
      node << run
    end

    it_should_output_correct_xml node_xml: "paragraph_with_runs"
  end

  context "without runs" do
    before(:each) do
      @node = described_class.new
      node.alignment = :center
    end

    it_should_output_correct_xml
  end

end
