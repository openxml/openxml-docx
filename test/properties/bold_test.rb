require "test_helper"

class BoldTest < PropertyTest
  attr_reader :bold

  context "always" do
    setup do
      @bold = Bold.new(false)
    end

    should "have the right tag" do
      assert_equal :b, bold.tag
    end

    should "have the right name" do
      assert_equal "bold", bold.name
    end
  end

  context "when the value is true, it" do
    setup do
      @bold = Bold.new(true)
    end

    should "return XML" do
      assert_equal "<w:b/>", xml(bold)
    end
  end

  context "when the value is false, it" do
    setup do
      @bold = Bold.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(bold)
    end
  end

  context "when the value is nil, it" do
    setup do
      @bold = Bold.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(bold)
    end
  end

end
