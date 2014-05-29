require "test_helper"

class WidowControlTest < PropertyTest
  attr_reader :widow_control

  context "always" do
    setup do
      @widow_control = WidowControl.new(:on)
    end

    should "have the right tag" do
      assert_equal :widowControl, widow_control.tag
    end

    should "have the right name" do
      assert_equal "widow_control", widow_control.name
    end
  end

  context "when the value is on, it" do
    setup do
      @widow_control = WidowControl.new(:on)
    end

    should "return XML to that effect" do
      assert_equal "<w:widowControl w:val=\"on\"/>", xml(widow_control)
    end
  end

  context "when the value is off, it" do
    setup do
      @widow_control = WidowControl.new(:off)
    end

    should "return XML to that effect" do
      assert_equal "<w:widowControl w:val=\"off\"/>", xml(widow_control)
    end
  end

  context "when the value is nil, it" do
    setup do
      @widow_control = WidowControl.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(widow_control)
    end
  end

end
