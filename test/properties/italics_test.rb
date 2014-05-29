require "test_helper"

class ItalicsTest < PropertyTest
  attr_reader :italics

  context "always" do
    setup do
      @italics = Italics.new(false)
    end

    should "have the right tag" do
      assert_equal :i, italics.tag
    end

    should "have the right name" do
      assert_equal "italics", italics.name
    end
  end

  context "when the value is true, it" do
    setup do
      @italics = Italics.new(true)
    end

    should "return XML" do
      assert_equal "<w:i/>", xml(italics)
    end
  end

  context "when the value is false, it" do
    setup do
      @italics = Italics.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(italics)
    end
  end

  context "when the value is nil, it" do
    setup do
      @italics = Italics.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(italics)
    end
  end

end
