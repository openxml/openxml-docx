require "spec_helper"

describe OpenXml::Docx::Parts::Header do
  include PartTestMacros

  context "with child elements" do
    before(:each) do
      @doc = described_class.new
      paragraph = OpenXml::Docx::Elements::Paragraph.new

      first_run = OpenXml::Docx::Elements::Run.new
      first_run << OpenXml::Docx::Elements::Text.new("This is just a test run.")
      paragraph << first_run

      second_run = OpenXml::Docx::Elements::Run.new
      second_run << OpenXml::Docx::Elements::Text.new("But this isn't!")
      paragraph << second_run

      doc << paragraph
    end

    it_should_output_correct_xml part: "header_with_children"
  end

  context "with no elements" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml part: "empty_header"
  end

end
