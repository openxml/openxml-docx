require "test_helper"

class BidiTest < PropertyTest
  attr_reader :bidi

  context "always" do
    setup do
      @bidi = Bidi.new(false)
    end

    should "have the right tag" do
      assert_equal :bidi, bidi.tag
    end

    should "have the right name" do
      assert_equal "bidi", bidi.name
    end
  end

  context "when the value is true, it" do
    setup do
      @bidi = Bidi.new(true)
    end

    should "return XML" do
      assert_equal "<w:bidi/>", xml(bidi)
    end
  end

  context "when the value is false, it" do
    setup do
      @bidi = Bidi.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(bidi)
    end
  end

  context "when the value is nil, it" do
    setup do
      @bidi = Bidi.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(bidi)
    end
  end

end
