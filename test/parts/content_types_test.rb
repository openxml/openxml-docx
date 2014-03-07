require 'test_helper'

class ContentTypesTest < Test::Unit::TestCase
  attr_reader :content_types

  context "transforming to XML" do
    should "output the correct XML" do
      @content_types = Rocx::Parts::ContentTypes.new
      assert_equal part_xml('content_types'), content_types.to_xml
    end
  end
end
