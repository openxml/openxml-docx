require "test_helper"

class BorderTest < PropertyTest
  attr_reader :border

  context "always" do
    setup do
      @border = Border.new(:left)
    end

    should "have the right name" do
      assert_equal "border", border.name
    end

    should "have its tag be an argument on initialize" do
      assert_equal :left, border.tag
    end
  end

  context "for a border's color property" do
    setup do
      @border = Border.new(:left)
    end

    should "allow hex color values" do
      assert_nothing_raised do
        border.color = "4F81BD"
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        border.color = :auto
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        border.color = "green"
      end
    end
  end

  context "for a border's frame property" do
    setup do
      @border = Border.new(:right)
    end

    should "allow true or false" do
      assert_nothing_raised do
        border.frame = true
      end

      assert_nothing_raised do
        border.frame = false
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        border.frame = :yep
      end
    end
  end

  context "for a border's shadow property" do
    setup do
      @border = Border.new(:top)
    end

    should "allow true or false" do
      assert_nothing_raised do
        border.shadow = true
      end

      assert_nothing_raised do
        border.shadow = false
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        border.shadow = :yep
      end
    end
  end

  context "for a border's size property" do
    setup do
      @border = Border.new(:bar)
    end

    should "allow positive integers" do
      assert_nothing_raised do
        border.size = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        border.size = -24
      end

      assert_raises ArgumentError do
        border.size = :big
      end
    end
  end

  context "for a border's space property" do
    setup do
      @border = Border.new(:bottom)
    end

    should "allow positive integers" do
      assert_nothing_raised do
        border.space = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        border.space = -24
      end

      assert_raises ArgumentError do
        border.space = :big
      end
    end
  end

  context "for a border's theme color" do
    setup do
      @border = Border.new(:between)
    end

    should "only allow valid theme colors" do
      assert_nothing_raised do
        border.theme_color = :hyperlink
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        border.theme_color = :lens_flare
      end
    end
  end

  context "for a border's theme shade" do
    setup do
      @border = Border.new(:left)
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        border.theme_shade = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        border.theme_shade = :dark
      end
    end
  end

  context "for a border's theme tint" do
    setup do
      @border = Border.new(:right)
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        border.theme_shade = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        border.theme_shade = :pink
      end
    end
  end

  context "for a border's type" do
    setup do
      @border = Border.new(:top)
    end

    should "only allow valid types" do
      assert_nothing_raised do
        border.type = :single
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        border.type = :programmers
      end
    end
  end

  context "with proper attributes, it" do
    setup do
      @border = Border.new(:left)
      border.color = "FF00FF"
      border.type = :crazyMaze
    end

    should "output the right XML" do
      assert_equal "<w:left w:color=\"FF00FF\" w:val=\"crazyMaze\"/>", xml(border)
    end
  end

end
