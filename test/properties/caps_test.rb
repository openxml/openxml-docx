require "test_helper"

class CapsTest < PropertyTest
  attr_reader :caps

  context "always" do
    setup do
      @caps = Caps.new(false)
    end

    should "have the right tag" do
      assert_equal :caps, caps.tag
    end

    should "have the right name" do
      assert_equal "caps", caps.name
    end
  end

  context "when the value is true, it" do
    setup do
      @caps = Caps.new(true)
    end

    should "return XML" do
      assert_equal "<w:caps/>", xml(caps)
    end
  end

  context "when the value is false, it" do
    setup do
      @caps = Caps.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(caps)
    end
  end

  context "when the value is nil, it" do
    setup do
      @caps = Caps.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(caps)
    end
  end

end
