require "test_helper"

class DoubleStrikethroughTest < PropertyTest
  attr_reader :double_strikethrough

  context "always" do
    setup do
      @double_strikethrough = DoubleStrikethrough.new(false)
    end

    should "have the right tag" do
      assert_equal :dstrike, double_strikethrough.tag
    end

    should "have the right name" do
      assert_equal "double_strikethrough", double_strikethrough.name
    end
  end

  context "when the value is true, it" do
    setup do
      @double_strikethrough = DoubleStrikethrough.new(true)
    end

    should "return XML" do
      assert_equal "<w:dstrike w:val=\"true\"/>", xml(double_strikethrough)
    end
  end

  context "when the value is false, it" do
    setup do
      @double_strikethrough = DoubleStrikethrough.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(double_strikethrough)
    end
  end

  context "when the value is nil, it" do
    setup do
      @double_strikethrough = DoubleStrikethrough.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(double_strikethrough)
    end
  end

end
