require "test_helper"

class EastAsianLayoutTest < PropertyTest
  attr_reader :layout

  context "always" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "have the right name" do
      assert_equal "east_asian_layout", layout.name
    end

    should "have the right tag" do
      assert_equal :eastAsianLayout, layout.tag
    end
  end

  context "for the combine attribute, it" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "allow :on" do
      assert_nothing_raised do
        layout.combine = :on
      end
    end

    should "allow :off" do
      assert_nothing_raised do
        layout.combine = :off
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        layout.combine = :somethingElse
      end
    end
  end

  context "for the combine brackets attribute, it" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "allow :angle" do
      assert_nothing_raised do
        layout.combine_brackets = :angle
      end
    end

    should "allow :curly" do
      assert_nothing_raised do
        layout.combine_brackets = :curly
      end
    end

    should "allow :none" do
      assert_nothing_raised do
        layout.combine_brackets = :none
      end
    end

    should "allow :round" do
      assert_nothing_raised do
        layout.combine_brackets = :round
      end
    end

    should "allow :square" do
      assert_nothing_raised do
        layout.combine_brackets = :square
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        layout.combine_brackets = :smileyFaces
      end
    end
  end

  context "for the id attribute, it" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        layout.id = 1
      end
    end

    should "allow negative integers" do
      assert_nothing_raised do
        layout.id = -81238123
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        layout.id = 4.5
      end

      assert_raises ArgumentError do
        layout.id = :number1234
      end
    end
  end

  context "for the vertical attribute, it" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "allow :on" do
      assert_nothing_raised do
        layout.vertical = :on
      end
    end

    should "allow :off" do
      assert_nothing_raised do
        layout.vertical = :off
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        layout.vertical = :sorta
      end
    end

  end

  context "for the vertical compress attribute, it" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "allow :on" do
      assert_nothing_raised do
        layout.vertical_compress = :on
      end
    end

    should "allow :off" do
      assert_nothing_raised do
        layout.vertical_compress = :off
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        layout.vertical_compress = :sorta
      end
    end
  end

  context "with no attributes set" do
    setup do
      @layout = EastAsianLayout.new
    end

    should "not output any XML" do
      assert_equal "", xml(layout)
    end
  end

  context "with attributes set to valid values, it" do
    setup do
      @layout = EastAsianLayout.new
      layout.id = 2
      layout.vertical = :on
      layout.vertical_compress = :on
    end

    should "output the correct XML" do
      assert_equal "<w:eastAsianLayout w:id=\"2\" w:vert=\"on\" w:vertCompress=\"on\"/>", xml(layout)
    end
  end

end
