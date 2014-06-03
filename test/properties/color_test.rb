require "test_helper"

class ColorTest < PropertyTest
  attr_reader :color

  context "always" do
    setup do
      @color = Color.new
    end

    should "have the right name" do
      assert_equal "color", color.name
    end

    should "have the right tag" do
      assert_equal :color, color.tag
    end
  end

  context "for the theme color attribute, it" do
    setup do
      @color = Color.new
    end

    should "only allow valid theme colors" do
      assert_nothing_raised do
        color.theme_color = :hyperlink
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        color.theme_color = :lens_flare
      end
    end
  end

  context "for the theme shade attribute, it" do
    setup do
      @color = Color.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        color.theme_shade = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        color.theme_shade = :dark
      end
    end
  end

  context "for the theme tint attribute, it" do
    setup do
      @color = Color.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        color.theme_tint = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        color.theme_tint = :dark
      end
    end
  end

  context "for the color attribute, it" do
    setup do
      @color = Color.new
    end

    should "allow hex color values" do
      assert_nothing_raised do
        color.color = "4F81BD"
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        color.color = :auto
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        color.color = "green"
      end
    end
  end

  context "with no attributes set, it" do
    setup do
      @color = Color.new
    end

    should "not output any XML" do
      assert_equal "", xml(color)
    end
  end

  context "with valid attributes set, it" do
    setup do
      @color = Color.new
      color.color = "D99694"
      color.theme_color = :accent1
      color.theme_tint = "99"
    end

    should "output the correct XML" do
      assert_equal "<w:color w:val=\"D99694\" w:themeColor=\"accent1\" w:themeTint=\"99\"/>", xml(color)
    end
  end

end
