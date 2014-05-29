require "test_helper"

class MirrorIndentTest < PropertyTest
  attr_reader :mirror_indent

  context "always" do
    setup do
      @mirror_indent = MirrorIndent.new(false)
    end

    should "have the right tag" do
      assert_equal :mirrorIndent, mirror_indent.tag
    end

    should "have the right name" do
      assert_equal "mirror_indent", mirror_indent.name
    end
  end

  context "when the value is true, it" do
    setup do
      @mirror_indent = MirrorIndent.new(true)
    end

    should "return XML" do
      assert_equal "<w:mirrorIndent/>", xml(mirror_indent)
    end
  end

  context "when the value is false, it" do
    setup do
      @mirror_indent = MirrorIndent.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(mirror_indent)
    end
  end

  context "when the value is nil, it" do
    setup do
      @mirror_indent = MirrorIndent.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(mirror_indent)
    end
  end

end
