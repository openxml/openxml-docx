require "test_helper"

class HighlightTest < PropertyTest
  attr_reader :highlight

  context "always" do
    setup do
      @highlight = Highlight.new(:yellow)
    end

    should "have the right name" do
      assert_equal "highlight", highlight.name
    end

    should "have the right tag" do
      assert_equal :highlight, highlight.tag
    end
  end

  context "with valid values," do
    valid_colors = %i(black blue cyan darkBlue darkCyan darkGray darkGreen darkMagenta darkRed darkYellow green lightGray magenta none red white yellow)
    valid_colors.each do |color|
      context "like :#{color}, it" do
        should "output the correct XML" do
          assert_nothing_raised do
            @highlight = Highlight.new(color)
            assert_equal "<w:highlight w:val=\"#{color}\"/>", xml(highlight)
          end
        end
      end
    end
  end

  context "with an invalid value, it" do
    should "raise an exception" do
      assert_raises ArgumentError do
        @highlight = Highlight.new(:purple)
      end
    end
  end

end
