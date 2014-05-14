require "test_helper"

class TextTest < Test::Unit::TestCase
  attr_reader :text

  context "when creating a new run, it" do
    should "accept some properties" do
      @text = Rocx::Elements::Text.new("Banana", "xml:space" => "preserve")
      expected_value = "preserve"
      assert_equal expected_value, text["xml:space"], "Expected the property to be set on the text when initialized with it"
    end
  end

  context "after creation, it" do
    setup do
      @text = Rocx::Elements::Text.new("Smucker's Preserves")
    end

    should "be able to have additional properties set" do
      text["xml:space"] = "preserve"
      assert_equal 1, text.properties.length, "Expected the text's new property to be successfully added"
    end

    should "return the proper XML" do
      text["xml:space"] = "preserve"
      text_xml = build_xml do |xml|
        text.to_xml(xml)
      end
      assert_equal element_xml("text"), text_xml
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
