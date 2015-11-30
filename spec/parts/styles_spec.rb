require "spec_helper"

describe OpenXml::Docx::Parts::Styles do
  include PartTestMacros

  context "when adding no additional styles" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml
  end

  context "after adding additional styles" do
    before(:each) do
      @doc = described_class.new

      style = OpenXml::Docx::Style.new(:paragraph)
      style.id = "coolStyle"
      style.paragraph.alignment = :start

      doc << style
    end

    it_should_output_correct_xml part: "styles_with_custom_style"
  end
end
