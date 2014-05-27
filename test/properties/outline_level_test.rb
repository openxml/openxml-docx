require "test_helper"

class OutlineLevelTest < PropertyTest
  attr_reader :outline_level

  context "always" do
    setup do
      @outline_level = Rocx::Properties::OutlineLevel.new(0)
    end

    should "have the right tag" do
      assert_equal :outlineLvl, outline_level.tag
    end

    should "have the right name" do
      assert_equal "outline_level", outline_level.name
    end
  end

  context "with non-integer values, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @outline_level = Rocx::Properties::OutlineLevel.new(:big)
      end
    end
  end

  context "with integers less than 0, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @outline_level = Rocx::Properties::OutlineLevel.new(-1)
      end
    end
  end

  context "with valid value, it" do
    setup do
      @outline_level = Rocx::Properties::OutlineLevel.new(2)
    end

    should "return the proper XML" do
      assert_equal "<w:outlineLvl w:val=\"2\"/>", xml(outline_level)
    end
  end

end
