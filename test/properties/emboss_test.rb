require "test_helper"

class EmbossTest < PropertyTest
  attr_reader :emboss

  context "always" do
    setup do
      @emboss = Emboss.new(false)
    end

    should "have the right tag" do
      assert_equal :emboss, emboss.tag
    end

    should "have the right name" do
      assert_equal "emboss", emboss.name
    end
  end

  context "when the value is true, it" do
    setup do
      @emboss = Emboss.new(true)
    end

    should "return XML" do
      assert_equal "<w:emboss/>", xml(emboss)
    end
  end

  context "when the value is false, it" do
    setup do
      @emboss = Emboss.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(emboss)
    end
  end

  context "when the value is nil, it" do
    setup do
      @emboss = Emboss.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(emboss)
    end
  end

end
