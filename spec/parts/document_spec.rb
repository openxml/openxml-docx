require "spec_helper"

describe OpenXml::Docx::Parts::Document do
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

    it_should_output_correct_xml part: "document_with_children"
  end

  context "with no elements" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml part: "empty_document"
  end

  context "with only one section" do
    before(:each) do
      @doc = described_class.new

      section = OpenXml::Docx::Section.new
      section.bidi = true

      doc << section

      paragraph = OpenXml::Docx::Elements::Paragraph.new

      first_run = OpenXml::Docx::Elements::Run.new
      first_run << OpenXml::Docx::Elements::Text.new("This is just a test run.")
      paragraph << first_run

      second_run = OpenXml::Docx::Elements::Run.new
      second_run << OpenXml::Docx::Elements::Text.new("But this isn't!")
      paragraph << second_run

      doc << paragraph
    end

    it_should_output_correct_xml part: "document_with_one_section"
  end

  context "with multiple sections" do
    before(:each) do
      @doc = described_class.new

      section = OpenXml::Docx::Section.new
      section.bidi = true

      doc << section

      paragraph = OpenXml::Docx::Elements::Paragraph.new

      first_run = OpenXml::Docx::Elements::Run.new
      first_run << OpenXml::Docx::Elements::Text.new("This is just a test run.")
      paragraph << first_run

      second_run = OpenXml::Docx::Elements::Run.new
      second_run << OpenXml::Docx::Elements::Text.new("But this isn't!")
      paragraph << second_run

      doc << paragraph

      section = OpenXml::Docx::Section.new
      section.text_direction = :lr

      doc << section

      paragraph = OpenXml::Docx::Elements::Paragraph.new

      first_run = OpenXml::Docx::Elements::Run.new
      first_run << OpenXml::Docx::Elements::Text.new("This is just a test run.")
      paragraph << first_run

      doc << paragraph
    end

    it_should_output_correct_xml part: "document_with_multiple_sections"
  end
end
