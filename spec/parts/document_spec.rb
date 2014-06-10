require "spec_helper"

describe Rocx::Parts::Document do
  include PartTestMacros

  context "with child elements" do
    before(:each) do
      @doc = described_class.new
      paragraph = Rocx::Elements::Paragraph.new

      first_run = Rocx::Elements::Run.new
      first_run << Rocx::Elements::Text.new("This is just a test run.")
      paragraph << first_run

      second_run = Rocx::Elements::Run.new
      second_run << Rocx::Elements::Text.new("But this isn't!")
      paragraph << second_run

      doc << paragraph
    end

    it_should_output_correct_xml part: "document_with_children"
  end

  context "with no elements" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml part: "empty_document"
  end
end
