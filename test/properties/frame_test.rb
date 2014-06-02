require "test_helper"

class FrameTest < PropertyTest
  attr_reader :frame

  context "always" do
    setup do
      @frame = Frame.new
    end

    should "have the correct tag" do
      assert_equal :framePr, frame.tag
    end

    should "have the correct name" do
      assert_equal "frame", frame.name
    end
  end

  context "for the anchor lock attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow true or false" do
      assert_nothing_raised do
        frame.anchor_lock = true
      end

      assert_nothing_raised do
        frame.anchor_lock = false
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.anchor_lock = :maybe
      end
    end
  end

  context "for the drop cap attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :drop" do
      assert_nothing_raised do
        frame.drop_cap = :drop
      end
    end

    should "allow :margin" do
      assert_nothing_raised do
        frame.drop_cap = :margin
      end
    end

    should "allow :none" do
      assert_nothing_raised do
        frame.drop_cap = :none
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.drop_cap = :bad
      end
    end
  end

  context "for the height attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        frame.height = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.height = -24
      end

      assert_raises ArgumentError do
        frame.height = :big
      end
    end
  end

  context "for the horizonal anchor attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :margin" do
      assert_nothing_raised do
        frame.horizontal_anchor = :margin
      end
    end

    should "allow :page" do
      assert_nothing_raised do
        frame.horizontal_anchor = :page
      end
    end

    should "allow :text" do
      assert_nothing_raised do
        frame.horizontal_anchor = :text
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.horizontal_anchor = :something_bad
      end
    end
  end

  context "for the height rule attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :atLeast" do
      assert_nothing_raised do
        frame.height_rule = :atLeast
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        frame.height_rule = :auto
      end
    end

    should "allow :exact" do
      assert_nothing_raised do
        frame.height_rule = :exact
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.height_rule = :something_bad
      end
    end
  end

  context "for the horizontal padding attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        frame.horizontal_padding = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.horizontal_padding = -23
      end

      assert_raises ArgumentError do
        frame.horizontal_padding = 19.4
      end

      assert_raises ArgumentError do
        frame.horizontal_padding = :two
      end
    end
  end

  context "for the lines attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        frame.lines = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.lines = -23
      end

      assert_raises ArgumentError do
        frame.lines = 19.4
      end

      assert_raises ArgumentError do
        frame.lines = :two
      end
    end
  end

  context "for the vertical anchor attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :margin" do
      assert_nothing_raised do
        frame.vertical_anchor = :margin
      end
    end

    should "allow :page" do
      assert_nothing_raised do
        frame.vertical_anchor = :page
      end
    end

    should "allow :text" do
      assert_nothing_raised do
        frame.vertical_anchor = :text
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.vertical_anchor = :something_bad
      end
    end
  end

  context "for the vertical padding attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        frame.vertical_padding = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.vertical_padding = -23
      end

      assert_raises ArgumentError do
        frame.vertical_padding = 19.4
      end

      assert_raises ArgumentError do
        frame.vertical_padding = :two
      end
    end
  end

  context "for the width attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        frame.width = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.width = -23
      end

      assert_raises ArgumentError do
        frame.width = 19.4
      end

      assert_raises ArgumentError do
        frame.width = :two
      end
    end
  end

  context "for the wrap attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :around" do
      assert_nothing_raised do
        frame.wrap = :around
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        frame.wrap = :auto
      end
    end

    should "allow :none" do
      assert_nothing_raised do
        frame.wrap = :none
      end
    end

    should "allow :notBeside" do
      assert_nothing_raised do
        frame.wrap = :notBeside
      end
    end

    should "allow :through" do
      assert_nothing_raised do
        frame.wrap = :through
      end
    end

    should "allow :tight" do
      assert_nothing_raised do
        frame.wrap = :tight
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.wrap = :something_bad
      end
    end
  end

  context "for the horizontal position attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow integers" do
      assert_nothing_raised do
        frame.horizontal_position = 24
      end

      assert_nothing_raised do
        frame.horizontal_position = -24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.horizontal_position = 19.4
      end

      assert_raises ArgumentError do
        frame.horizontal_position = :two
      end
    end
  end

  context "for the relative horizontal position attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :center" do
      assert_nothing_raised do
        frame.relative_horizontal_position = :center
      end
    end

    should "allow :inside" do
      assert_nothing_raised do
        frame.relative_horizontal_position = :inside
      end
    end

    should "allow :left" do
      assert_nothing_raised do
        frame.relative_horizontal_position = :left
      end
    end

    should "allow :outside" do
      assert_nothing_raised do
        frame.relative_horizontal_position = :outside
      end
    end

    should "allow :right" do
      assert_nothing_raised do
        frame.relative_horizontal_position = :right
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.relative_horizontal_position = :something_bad
      end
    end
  end

  context "for the vertical position attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow integers" do
      assert_nothing_raised do
        frame.vertical_position = 24
      end

      assert_nothing_raised do
        frame.vertical_position = -24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.vertical_position = 19.4
      end

      assert_raises ArgumentError do
        frame.vertical_position = :two
      end
    end
  end

  context "for the relative vertical position attribute" do
    setup do
      @frame = Frame.new
    end

    should "allow :bottom" do
      assert_nothing_raised do
        frame.relative_vertical_position = :bottom
      end
    end

    should "allow :center" do
      assert_nothing_raised do
        frame.relative_vertical_position = :center
      end
    end

    should "allow :inline" do
      assert_nothing_raised do
        frame.relative_vertical_position = :inline
      end
    end

    should "allow :inside" do
      assert_nothing_raised do
        frame.relative_vertical_position = :inside
      end
    end

    should "allow :outside" do
      assert_nothing_raised do
        frame.relative_vertical_position = :outside
      end
    end

    should "allow :top" do
      assert_nothing_raised do
        frame.relative_vertical_position = :top
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        frame.relative_horizontal_position = :something_bad
      end
    end
  end

  context "with proper attributes, it" do
    setup do
      @frame = Frame.new
      frame.width = 2419
      frame.height = 2189
      frame.height_rule = :atLeast
      frame.horizontal_padding = 187
      frame.wrap = :around
      frame.vertical_anchor = :text
      frame.horizontal_anchor = :page
      frame.horizontal_position = 1643
      frame.vertical_position = 73
    end

    should "output the right XML" do
      assert_equal "<w:framePr w:h=\"2189\" w:hRule=\"atLeast\" w:hAnchor=\"page\" w:hSpace=\"187\" w:x=\"1643\" w:vAnchor=\"text\" w:y=\"73\" w:w=\"2419\" w:wrap=\"around\"/>", xml(frame)
    end
  end

end
