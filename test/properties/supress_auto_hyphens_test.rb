require "test_helper"

class SupressAutoHyphensTest < PropertyTest
  attr_reader :supress_auto_hyphens

  context "always" do
    setup do
      @supress_auto_hyphens = Rocx::Properties::SupressAutoHyphens.new(false)
    end

    should "have the right tag" do
      assert_equal :supressAutoHyphens, supress_auto_hyphens.tag
    end

    should "have the right name" do
      assert_equal "supress_auto_hyphens", supress_auto_hyphens.name
    end
  end

  context "when the value is true, it" do
    setup do
      @supress_auto_hyphens = Rocx::Properties::SupressAutoHyphens.new(true)
    end

    should "return XML" do
      assert_equal "<w:supressAutoHyphens/>", xml(supress_auto_hyphens)
    end
  end

  context "when the value is false, it" do
    setup do
      @supress_auto_hyphens = Rocx::Properties::SupressAutoHyphens.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(supress_auto_hyphens)
    end
  end

  context "when the value is nil, it" do
    setup do
      @supress_auto_hyphens = Rocx::Properties::SupressAutoHyphens.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(supress_auto_hyphens)
    end
  end

end
