require "test_helper"

class TabTest < PropertyTest
  attr_reader :tab

  context "always" do
    setup do
      @tab = Tab.new(1234, :start)
    end

    should "have the right name" do
      assert_equal "tab", tab.name
    end

    should "have the right tag" do
      assert_equal :tab, tab.tag
    end
  end

  context "when assigning bad position values, it" do
    should "raise an exception" do
      assert_raises ArgumentError do
        @tab = Tab.new(:bad, :start)
      end
    end
  end

  context "when assigning bad type values, it" do
    should "raise an exception" do
      assert_raises ArgumentError do
        @tab = Tab.new(1234, :bad)
      end
    end
  end

  context "when assigniing bad leader values, it" do
    should "raise an exception" do
      assert_raises ArgumentError do
        @tab = Tab.new(1234, :clear, :bad)
      end
    end
  end

  context "with valid values, it" do
    setup do
      @tab = Tab.new(1234, :start)
    end

    should "return the right XML" do
      assert_equal "<w:tab w:pos=\"1234\" w:val=\"start\"/>", xml(tab)
    end
  end

  context "with valid values and a specified leader, it" do
    setup do
      @tab = Tab.new(1234, :start, :dot)
    end

    should "Return the right XML" do
      assert_equal "<w:tab w:pos=\"1234\" w:val=\"start\" w:leader=\"dot\"/>", xml(tab)
    end
  end
end
