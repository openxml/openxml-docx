require "test_helper"

class RelsTest < Test::Unit::TestCase
  attr_reader :rels

  context "when initially setting up the rels, it" do
    setup do
      @rels = Rocx::Parts::Rels.new
    end

    should "automatically create the relationship to the settings file" do
      expected_relation = { "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings",
           "Target" => "/word/settings.xml",
           "Id" => "R1efaa81aac7a4831" }
      assert rels.relationships.member?(expected_relation), "Expected the default settings relation to be present"
    end

    should "automatically create the relationship to the styles file" do
      expected_relation = { "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles",
           "Target" => "/word/styles.xml",
           "Id" => "Rf06246a95c004384" }
      assert rels.relationships.member?(expected_relation), "Expected the default styles relation to be present"
    end
  end

  context "after setting up the rels, it" do
    setup do
      @rels = Rocx::Parts::Rels.new
    end

    should "be possible to add additional relationships" do
      new_relationship = { "Type" => "http://coolml.org/coolDocument",
        "Target" => "/cool/cool.xml",
        "Id" => "123456789"
      }
      rels.relationship *new_relationship.values
      assert rels.relationships.member?(new_relationship), "Expected the new relationship to have been added"
    end
  end

  context "transforming to XML" do
    should "output the correct XML" do
      @rels = Rocx::Parts::Rels.new
      assert_equal part_xml('rels').strip, rels.read
    end
  end

end
