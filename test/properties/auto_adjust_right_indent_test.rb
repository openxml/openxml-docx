require "test_helper"

class AutoAdjustRightIndentTest < PropertyTest
  attr_reader :auto_adjust_right_ind

  context "always" do
    setup do
      @auto_adjust_right_ind = AutoAdjustRightIndent.new(false)
    end

    should "have the right tag" do
      assert_equal :adjustRightInd, auto_adjust_right_ind.tag
    end

    should "have the right name" do
      assert_equal "auto_adjust_right_ind", auto_adjust_right_ind.name
    end
  end

  context "when the value is true, it" do
    setup do
      @auto_adjust_right_ind = AutoAdjustRightIndent.new(true)
    end

    should "return XML" do
      assert_equal "<w:adjustRightInd w:val=\"true\"/>", xml(auto_adjust_right_ind)
    end
  end

  context "when the value is false, it" do
    setup do
      @auto_adjust_right_ind = AutoAdjustRightIndent.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(auto_adjust_right_ind)
    end
  end

  context "when the value is nil, it" do
    setup do
      @auto_adjust_right_ind = AutoAdjustRightIndent.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(auto_adjust_right_ind)
    end
  end

end
