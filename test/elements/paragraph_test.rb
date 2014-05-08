require "test_helper"

class ParagraphTest < Test::Unit::TestCase
  attr_reader :paragraph

  context "when creating a new paragraph, it" do
    should "accept some properties" do
      @paragraph = Rocx::Elements::Paragraph.new("w:jc" => {"w:val" => "center"})
      expected_value = {"w:val" => "center"}
      assert_equal expected_value, paragraph["w:jc"], "Expected the property to be set on the paragraph when initialized with it"
    end
  end

  context "after creation, it" do
    setup do
      @paragraph = Rocx::Elements::Paragraph.new("w:jc" => {"w:val" => "center"})
    end

    should "be able to have additional properties set" do
      paragraph["w:ind"] = {"w:firstLine" => 0, "w:left" => 0, "w:right" => 0}
      assert_equal 2, paragraph.properties.length, "Expected the paragraph's properties to be added"
    end
  end

  should "be able to add a run" do
    @paragraph = Rocx::Elements::Paragraph.new
    run = Rocx::Elements::Run.new("Blah blah blah")
    paragraph << run
    assert_equal 1, paragraph.runs.length, "Expected the run to be added to the paragraph's list of runs"
  end

  context "when there are no runs" do
    setup do
      @paragraph = Rocx::Elements::Paragraph.new("w:jc" => {"w:val" => "center"})
    end

    should "return the proper XML" do
      paragraph_xml = build_xml do |xml|
        paragraph.to_xml(xml)
      end

      assert_equal element_xml("paragraph"), paragraph_xml, "Expected the generated XML to match expectations"
    end
  end

  context "where there are runs" do
    setup do
      @paragraph = Rocx::Elements::Paragraph.new("w:jc" => {"w:val" => "center"})
      paragraph << Rocx::Elements::Run.new("Hey Run 1")
      paragraph << Rocx::Elements::Run.new("Hey Run 2")
    end

    should "return the proper XML" do
      paragraph_xml = build_xml do |xml|
        paragraph.to_xml(xml)
      end

      assert_equal element_xml("paragraph_with_runs"), paragraph_xml, "Expected the generated XML to match expectations"
    end
  end

private

  def build_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.fakeDocument("xmlns:w" => "http://wnamespace.com") {
        yield xml
      }
    end.to_xml
  end

end
