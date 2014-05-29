require "test_helper"

class KeepNextTest < PropertyTest
  attr_reader :keep_next

  context "always" do
    setup do
      @keep_next = KeepNext.new(false)
    end

    should "have the right tag" do
      assert_equal :keepNext, keep_next.tag
    end

    should "have the right name" do
      assert_equal "keep_next", keep_next.name
    end
  end

  context "when the value is true, it" do
    setup do
      @keep_next = KeepNext.new(true)
    end

    should "return XML" do
      assert_equal "<w:keepNext/>", xml(keep_next)
    end
  end

  context "when the value is false, it" do
    setup do
      @keep_next = KeepNext.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(keep_next)
    end
  end

  context "when the value is nil, it" do
    setup do
      @keep_next = KeepNext.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(keep_next)
    end
  end

end
