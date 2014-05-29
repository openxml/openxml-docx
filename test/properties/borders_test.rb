require "test_helper"

class BordersTest < PropertyTest
  attr_reader :borders

  context "always" do
    setup do
      @borders = Borders.new
    end

    should "set the right tag" do
      assert_equal :pBdr, borders.tag
    end

    should "set the right name" do
      assert_equal "borders", borders.name
    end
  end

  context "when setting values, it" do
    setup do
      @borders = Borders.new
    end

    should "allow left borders" do
      assert_nothing_raised do
        borders.left.color = :auto
      end
    end

    should "allow right borders" do
      assert_nothing_raised do
        borders.right.size = 24
      end
    end

    should "allow top borders" do
      assert_nothing_raised do
        borders.top.space = 1
      end
    end

    should "allow bottom borders" do
      assert_nothing_raised do
        borders.bottom.type = :apples
      end
    end

    should "allow between borders" do
      assert_nothing_raised do
        borders.between.shadow = true
      end
    end

    should "allow bar borders" do
      assert_nothing_raised do
        borders.bar.theme_color = :accent2
      end
    end
  end

  context "with no values set, it" do
    setup do
      @borders = Borders.new
    end

    should "not return any XML" do
      assert_equal "", xml(borders)
    end
  end

  context "when one border has at least one property set, it" do
    setup do
      @borders = Borders.new
      borders.left.type = :apples
    end

    should "return the XML" do
      assert_equal "<w:pBdr>\n    <w:left w:val=\"apples\"/>\n  </w:pBdr>", xml(borders)
    end
  end

  context "when more than one border has at least one property set, it" do
    setup do
      @borders = Borders.new
      borders.left.color = "FF0000"
      borders.right.type = :apples
    end

    should "return the correct XML" do
      assert_equal "<w:pBdr>\n    <w:left w:color=\"FF0000\"/>\n    <w:right w:val=\"apples\"/>\n  </w:pBdr>", xml(borders)
    end
  end

end
