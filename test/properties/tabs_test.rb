require "test_helper"

class TabsTest < PropertyTest
  attr_reader :tabs

  context "always" do
    setup do
      @tabs = Tabs.new
    end

    should "have the right name" do
      assert_equal "tabs", tabs.name
    end

    should "have the right tag" do
      assert_equal :tabs, tabs.tag
    end
  end

  context "when trying to add tabs, it" do
    setup do
      @tabs = Tabs.new
    end

    should "raise an exception if the tab to be added isn't a tab at all" do
      assert_raises ArgumentError do
        tabs << []
      end
    end
  end

  context "when there are no tabs, it" do
    setup do
      @tabs = Tabs.new
    end

    should "not return any XML" do
      assert_equal "", xml(tabs)
    end
  end

  context "when there are tabs, it" do
    setup do
      @tabs = Tabs.new
      tabs << Tab.new(1234, :start)
      tabs << Tab.new(5678, :end, :heavy)
    end

    should "return the correct XML" do
      assert_equal "<w:tabs>\n    <w:tab w:pos=\"1234\" w:val=\"start\"/>\n    <w:tab w:pos=\"5678\" w:val=\"end\" w:leader=\"heavy\"/>\n  </w:tabs>", xml(tabs)
    end
  end

end
