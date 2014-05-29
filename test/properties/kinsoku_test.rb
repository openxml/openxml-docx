require "test_helper"

class KinsokuTest < PropertyTest
  attr_reader :kinsoku

  context "always" do
    setup do
      @kinsoku = Kinsoku.new(:on)
    end

    should "have the right tag" do
      assert_equal :kinsoku, kinsoku.tag
    end

    should "have the right name" do
      assert_equal "kinsoku", kinsoku.name
    end
  end

  context "when the value is on, it" do
    setup do
      @kinsoku = Kinsoku.new(:on)
    end

    should "return XML to that effect" do
      assert_equal "<w:kinsoku w:val=\"on\"/>", xml(kinsoku)
    end
  end

  context "when the value is off, it" do
    setup do
      @kinsoku = Kinsoku.new(:off)
    end

    should "return XML to that effect" do
      assert_equal "<w:kinsoku w:val=\"off\"/>", xml(kinsoku)
    end
  end

  context "when the value is nil, it" do
    setup do
      @kinsoku = Kinsoku.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(kinsoku)
    end
  end

end
