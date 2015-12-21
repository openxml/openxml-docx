require "spec_helper"

describe OpenXml::Docx::Parts::Settings do
  include PartTestMacros

  context "always" do
    before(:each) do
      @doc = described_class.new
      booklet_printing = OpenXml::Docx::Elements::BookFoldPrinting.new
      booklet_printing.value = true
      @doc << booklet_printing
      booklet_pagecount = OpenXml::Docx::Elements::BookFoldPrintingSheets.new
      booklet_pagecount.value = 4
      @doc << booklet_pagecount
    end

    it_should_output_correct_xml
  end
end
