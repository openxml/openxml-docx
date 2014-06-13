require "spec_helper"

describe Rocx::Elements::Paragraph do
  include ElementTestMacros

  it_should_use tag: :p, name: "paragraph"

  context "with runs" do
    before(:each) do
      @instance = described_class.new
      instance.indentation.start = 720
      instance.indentation.end = -1440
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 1")
      instance << run
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 2")
      instance << run
    end

    it_should_output_correct_xml node_xml: "paragraph_with_runs"
  end

  context "without runs" do
    before(:each) do
      @instance = described_class.new
      instance.alignment = :center
    end

    it_should_output_correct_xml
  end

end
