require "spec_helper"

describe Rocx::Package do
  attr_reader :package

  context "when starting a new package" do
    before(:each) do
      @package = described_class.new
    end

    it "should create the content types part" do
      expect(package.content_types).to be_instance_of(Rocx::Parts::ContentTypes)
    end

    it "should create the document part" do
      expect(package.document).to be_instance_of(Rocx::Parts::Document)
    end

    it "should create the global rels part" do
      expect(package.global_rels).to be_instance_of(Rocx::Parts::GlobalRels)
    end

    it "should create the _rels part" do
      expect(package.rels).to be_instance_of(Rocx::Parts::Rels)
    end

    it "should create the settings part" do
      expect(package.settings).to be_instance_of(Rocx::Parts::Settings)
    end

    it "should create the styles part" do
      expect(package.styles).to be_instance_of(Rocx::Parts::Styles)
    end
  end

  context "when saving a package" do
    before(:each) do
      @package = described_class.new
    end

    it "should write to a OpenXmlPackage" do
      path = "some_file.docx"
      mock.instance_of(OpenXmlPackage).write_to(path)
      package.save(path)
    end
  end

end
