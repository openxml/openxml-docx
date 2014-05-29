require "test_helper"

class OverflowPunctuationTest < PropertyTest
  attr_reader :overflow_punctuation

  context "always" do
    setup do
      @overflow_punctuation = OverflowPunctuation.new(false)
    end

    should "have the right tag" do
      assert_equal :overflowPunct, overflow_punctuation.tag
    end

    should "have the right name" do
      assert_equal "overflow_punctuation", overflow_punctuation.name
    end
  end

  context "when the value is true, it" do
    setup do
      @overflow_punctuation = OverflowPunctuation.new(true)
    end

    should "return XML" do
      assert_equal "<w:overflowPunct w:val=\"true\"/>", xml(overflow_punctuation)
    end
  end

  context "when the value is false, it" do
    setup do
      @overflow_punctuation = OverflowPunctuation.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(overflow_punctuation)
    end
  end

  context "when the value is nil, it" do
    setup do
      @overflow_punctuation = OverflowPunctuation.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(overflow_punctuation)
    end
  end

end
