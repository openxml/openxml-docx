require "test_helper"

class WordWrapTest < PropertyTest
  attr_reader :word_wrap

  context "always" do
    setup do
      @word_wrap = Rocx::Properties::WordWrap.new(:on)
    end

    should "have the right tag" do
      assert_equal :wordWrap, word_wrap.tag
    end

    should "have the right name" do
      assert_equal "word_wrap", word_wrap.name
    end
  end

  context "when the value is on, it" do
    setup do
      @word_wrap = Rocx::Properties::WordWrap.new(:on)
    end

    should "return XML to that effect" do
      assert_equal "<w:wordWrap w:val=\"on\"/>", xml(word_wrap)
    end
  end

  context "when the value is off, it" do
    setup do
      @word_wrap = Rocx::Properties::WordWrap.new(:off)
    end

    should "return XML to that effect" do
      assert_equal "<w:wordWrap w:val=\"off\"/>", xml(word_wrap)
    end
  end

  context "when the value is nil, it" do
    setup do
      @word_wrap = Rocx::Properties::WordWrap.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(word_wrap)
    end
  end

end
