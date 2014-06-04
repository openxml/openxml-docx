require "test_helper"

class EmphasisTest < PropertyTest
  attr_reader :emphasis

  context "always" do
    setup do
      @emphasis = Emphasis.new(:dot)
    end

    should "have the right name" do
      assert_equal "emphasis", emphasis.name
    end

    should "have the right tag" do
      assert_equal :em, emphasis.tag
    end
  end

  context "with a value of :circle, it" do
    setup do
      @emphasis = Emphasis.new(:circle)
    end

    should "output the value in XML correctly" do
      assert_equal "<w:em w:val=\"circle\"/>", xml(emphasis)
    end
  end

  context "with a value of :comma, it" do
    setup do
      @emphasis = Emphasis.new(:comma)
    end

    should "output the value in XML correctly" do
      assert_equal "<w:em w:val=\"comma\"/>", xml(emphasis)
    end
  end

  context "with a value of :dot, it" do
    setup do
      @emphasis = Emphasis.new(:dot)
    end

    should "output the value in XML correctly" do
      assert_equal "<w:em w:val=\"dot\"/>", xml(emphasis)
    end
  end

  context "with a value of :none, it" do
    setup do
      @emphasis = Emphasis.new(:none)
    end

    should "output the value in XML correctly" do
      assert_equal "<w:em w:val=\"none\"/>", xml(emphasis)
    end
  end

  context "with a value of :underDot, it" do
    setup do
      @emphasis = Emphasis.new(:underDot)
    end

    should "output the value in XML correctly" do
      assert_equal "<w:em w:val=\"underDot\"/>", xml(emphasis)
    end
  end

  context "with another value, it" do
    should "raise an exception" do
      assert_raises ArgumentError do
        @emphasis = Emphasis.new(:somethingElse)
      end
    end
  end
end
