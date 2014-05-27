require "test_helper"

class SupressOverlapTest < PropertyTest
  attr_reader :supress_overlap

  context "always" do
    setup do
      @supress_overlap = Rocx::Properties::SupressOverlap.new(false)
    end

    should "have the right tag" do
      assert_equal :supressOverlap, supress_overlap.tag
    end

    should "have the right name" do
      assert_equal "supress_overlap", supress_overlap.name
    end
  end

  context "when the value is true, it" do
    setup do
      @supress_overlap = Rocx::Properties::SupressOverlap.new(true)
    end

    should "return XML" do
      assert_equal "<w:supressOverlap/>", xml(supress_overlap)
    end
  end

  context "when the value is false, it" do
    setup do
      @supress_overlap = Rocx::Properties::SupressOverlap.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(supress_overlap)
    end
  end

  context "when the value is nil, it" do
    setup do
      @supress_overlap = Rocx::Properties::SupressOverlap.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(supress_overlap)
    end
  end

end
