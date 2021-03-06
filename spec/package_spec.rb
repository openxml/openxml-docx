require "spec_helper"

describe OpenXml::Docx::Package do
  attr_reader :package

  context "when starting a new package" do
    before(:each) do
      @package = described_class.new
    end

    it "should create the content types part" do
      expect(package.content_types).to be_instance_of(OpenXml::Parts::ContentTypes)
    end

    it "should create the document part" do
      expect(package.document).to be_instance_of(OpenXml::Docx::Parts::Document)
    end

    it "should create the global rels part" do
      expect(package.rels).to be_instance_of(OpenXml::Parts::Rels)
    end

    it "should create the document's _rels part" do
      expect(package.document.relationships).to be_instance_of(OpenXml::Parts::Rels)
    end

    it "should create the settings part" do
      expect(package.settings).to be_instance_of(OpenXml::Docx::Parts::Settings)
    end

    it "should create the styles part" do
      expect(package.styles).to be_instance_of(OpenXml::Docx::Parts::Styles)
    end
  end

end
