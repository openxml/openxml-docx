require "spec_helper"

describe Rocx::Parts::Rels do
  include PartTestMacros

  context "when initially setting up the rels" do
    before(:each) do
      @doc = described_class.new
    end

    it "should automatically create the relationship to the settings file" do
      expected_relation = { "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings",
                            "Target" => "/word/settings.xml",
                            "Id" => "R1efaa81aac7a4831" }
      expect(doc.relationships).to include(expected_relation)
    end

    it "should automatically create the relationship to the styles file" do
      expected_relation = { "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles",
                            "Target" => "/word/styles.xml",
                            "Id" => "Rf06246a95c004384" }
      expect(doc.relationships).to include(expected_relation)
    end
  end

  context "after setting up the rels" do
    before(:each) do
      @doc = described_class.new
    end

    it "should be possible to add additional relationships" do
      new_relationship = { "Type" => "nope.com",
                           "Target" => "/cool/cool.xml",
                           "Id" => "1234567890" }
      doc.relationship *new_relationship.values
      expect(doc.relationships).to include(new_relationship)
    end

    it_should_output_correct_xml
  end

end
