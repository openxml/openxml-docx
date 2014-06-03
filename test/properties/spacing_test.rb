require "test_helper"

class SpacingTest < PropertyTest
  attr_reader :spacing

  context "always" do
    setup do
      @spacing = Spacing.new
    end

    should "have the right name" do
      assert_equal "spacing", spacing.name
    end

    should "have the right tag" do
      assert_equal :spacing, spacing.tag
    end
  end

  context "for the after attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        spacing.after = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.after = -24
      end

      assert_raises ArgumentError do
        spacing.after = :big
      end
    end
  end

  context "for the after autospacing attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow :on" do
      assert_nothing_raised do
        spacing.after_auto = :on
      end
    end

    should "allow :off" do
      assert_nothing_raised do
        spacing.after_auto = :off
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.after_auto = :on_and_off
      end
    end
  end

  context "for the after lines attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        spacing.after_lines = 24
      end
    end

    should "allow negative integers" do
      assert_nothing_raised do
        spacing.after_lines = -24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.after_lines = 2.5
      end

      assert_raises ArgumentError do
        spacing.after_lines = :big
      end
    end
  end

  context "for the before attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        spacing.before = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.before = -24
      end

      assert_raises ArgumentError do
        spacing.before = :big
      end
    end
  end

  context "for the before autospacing attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow :on" do
      assert_nothing_raised do
        spacing.before_auto = :on
      end
    end

    should "allow :off" do
      assert_nothing_raised do
        spacing.before_auto = :off
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.before_auto = :on_and_off
      end
    end
  end

  context "for the before lines attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        spacing.before_lines = 24
      end
    end

    should "allow negative integers" do
      assert_nothing_raised do
        spacing.before_lines = -24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.before_lines = 2.5
      end

      assert_raises ArgumentError do
        spacing.before_lines = :big
      end
    end
  end

  context "for the line attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        spacing.line = 24
      end
    end

    should "allow negative integers" do
      assert_nothing_raised do
        spacing.line = -24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        spacing.line = 2.5
      end

      assert_raises ArgumentError do
        spacing.line = :big
      end
    end
  end

  context "for the line rule attribute, it" do
    setup do
      @spacing = Spacing.new
    end

    should "allow :atLeast" do
      assert_nothing_raised do
        spacing.line_rule = :atLeast
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        spacing.line_rule = :auto
      end
    end

    should "allow :exact" do
      assert_nothing_raised do
        spacing.line_rule = :exact
      end
    end

    should "not all anything else" do
      assert_raises ArgumentError do
        spacing.line_rule = :bad
      end
    end
  end

  context "when no attributes are set, it" do
    setup do
      @spacing = Spacing.new
    end

    should "not output any XML" do
      assert_equal "", xml(spacing)
    end
  end

  context "when attribuets are set with valid values, it" do
    setup do
      @spacing = Spacing.new
      spacing.line = 276
      spacing.line_rule = :auto
    end

    should "output the correct XML" do
      assert_equal "<w:spacing w:line=\"276\" w:lineRule=\"auto\"/>", xml(spacing)
    end
  end

end
