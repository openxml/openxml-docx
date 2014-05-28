require "test_helper"

class CompressPunctuationTest < PropertyTest
  attr_reader :compress_punctuation

  context "always" do
    setup do
      @compress_punctuation = Rocx::Properties::CompressPunctuation.new(:on)
    end

    should "have the right tag" do
      assert_equal :topLinePunct, compress_punctuation.tag
    end

    should "have the right name" do
      assert_equal "compress_punctuation", compress_punctuation.name
    end
  end

  context "when the value is on, it" do
    setup do
      @compress_punctuation = Rocx::Properties::CompressPunctuation.new(:on)
    end

    should "return XML to that effect" do
      assert_equal "<w:topLinePunct w:val=\"on\"/>", xml(compress_punctuation)
    end
  end

  context "when the value is off, it" do
    setup do
      @compress_punctuation = Rocx::Properties::CompressPunctuation.new(:off)
    end

    should "return XML to that effect" do
      assert_equal "<w:topLinePunct w:val=\"off\"/>", xml(compress_punctuation)
    end
  end

  context "when the value is nil, it" do
    setup do
      @compress_punctuation = Rocx::Properties::CompressPunctuation.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(compress_punctuation)
    end
  end

end
