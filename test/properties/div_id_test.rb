require "test_helper"

class DivIdTest < PropertyTest
  attr_reader :div_id

  context "always" do
    setup do
      @div_id = DivId.new(0)
    end

    should "have the right tag" do
      assert_equal :divId, div_id.tag
    end

    should "have the right name" do
      assert_equal "div_id", div_id.name
    end
  end

  context "with non-integer values, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @div_id = DivId.new(:big)
      end
    end
  end

  context "with valid value, it" do
    setup do
      @div_id = DivId.new(2)
    end

    should "return the proper XML" do
      assert_equal "<w:divId w:val=\"2\"/>", xml(div_id)
    end
  end

end
