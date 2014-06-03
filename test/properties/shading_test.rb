require "test_helper"

class ShadingTest < PropertyTest
  attr_reader :shading

  context "always" do
    setup do
      @shading = Shading.new
    end

    should "have the right name" do
      assert_equal "shading", shading.name
    end

    should "have the right tag" do
      assert_equal :shd, shading.tag
    end
  end

  context "for the color attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "allow hex color values" do
      assert_nothing_raised do
        shading.color = "4F81BD"
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        shading.color = :auto
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        shading.color = "green"
      end
    end
  end

  context "for the fill attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "allow hex color values" do
      assert_nothing_raised do
        shading.fill = "4F81BD"
      end
    end

    should "allow :auto" do
      assert_nothing_raised do
        shading.fill = :auto
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        shading.fill = "green"
      end
    end
  end

  context "for the theme color attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "only allow valid theme colors" do
      assert_nothing_raised do
        shading.theme_color = :hyperlink
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_color = :lens_flare
      end
    end
  end

  context "for the theme fill attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "only allow valid theme colors" do
      assert_nothing_raised do
        shading.theme_fill = :hyperlink
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_fill = :lens_flare
      end
    end
  end

  context "for the theme fill shade attribute" do
    setup do
      @shading = Shading.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        shading.theme_fill_shade = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_fill_shade = :dark
      end
    end
  end

  context "for the theme fill tint attribute" do
    setup do
      @shading = Shading.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        shading.theme_fill_tint = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_fill_tint = :dark
      end
    end
  end

  context "for the theme shade attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        shading.theme_shade = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_shade = :dark
      end
    end
  end

  context "for the theme tint attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "only allow 2-digit hex colors" do
      assert_nothing_raised do
        shading.theme_tint = "BF"
      end
    end

    should "not allow anything else" do
      assert ArgumentError do
        shading.theme_tint = :dark
      end
    end
  end

  context "for the pattern attribute, it" do
    setup do
      @shading = Shading.new
    end

    should "allow valid values" do
      assert_nothing_raised do
        shading.pattern = :pct90
      end

      assert_nothing_raised do
        shading.pattern = :solid
      end

      assert_nothing_raised do
        shading.pattern = :vertStripe
      end
    end

    should "not allow non-valid values" do
      assert_raises ArgumentError do
        shading.pattern = :somethingIJustMadeUp
      end
    end
  end

  context "with no attributes set, it" do
    setup do
      @shading = Shading.new
    end

    should "not return any XML" do
      assert_equal "", xml(shading)
    end
  end

  context "with attributes set to valid values, it" do
    setup do
      @shading = Shading.new
      shading.pattern = :pct20
      shading.theme_color = :accent6
      shading.theme_fill = :accent3
    end

    should "return the correct XML" do
      assert_equal "<w:shd w:themeColor=\"accent6\" w:themeFill=\"accent3\" w:val=\"pct20\"/>", xml(shading)
    end
  end

end
