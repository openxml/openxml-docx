require "test_helper"

class ContentTypesTest < Test::Unit::TestCase
  attr_reader :content_types

  context "when first creating the content types, it" do
    setup do
      @content_types = Rocx::Parts::ContentTypes.new
    end

    should "install the preset defaults" do
      assert_equal 3, content_types.defaults.length, "Expected the number of defaults generated to match the number of preset defaults"
    end

    should "install the preset overrides" do
      assert_equal 2, content_types.overrides.length, "Expected the number of overrides generated to match the number of preset overrides"
    end
  end

  context "after initially creating the content types, it" do
    setup do
      @content_types = Rocx::Parts::ContentTypes.new
    end

    should "be able to add additional defaults" do
      content_types.default "coolml", "text/coolml"
      assert content_types.defaults.member?({"Extension" => "coolml", "ContentType" => "text/coolml"})
    end
  end

  context "transforming to XML" do
    should "output the correct XML" do
      @content_types = Rocx::Parts::ContentTypes.new
      assert_equal part_xml('content_types').strip, content_types.to_xml
    end
  end
end
