require "test_helper"

class PageBreakBeforeTest < PropertyTest
  attr_reader :page_break_before

  context "always" do
    setup do
      @page_break_before = Rocx::Properties::PageBreakBefore.new(false)
    end

    should "have the right tag" do
      assert_equal :pageBreakBefore, page_break_before.tag
    end

    should "have the right name" do
      assert_equal "page_break_before", page_break_before.name
    end
  end

  context "when the value is true, it" do
    setup do
      @page_break_before = Rocx::Properties::PageBreakBefore.new(true)
    end

    should "return XML" do
      assert_equal "<w:pageBreakBefore/>", xml(page_break_before)
    end
  end

  context "when the value is false, it" do
    setup do
      @page_break_before = Rocx::Properties::PageBreakBefore.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(page_break_before)
    end
  end

  context "when the value is nil, it" do
    setup do
      @page_break_before = Rocx::Properties::PageBreakBefore.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(page_break_before)
    end
  end

end
