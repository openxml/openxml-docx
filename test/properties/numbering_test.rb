require "test_helper"

class NumberingTest < PropertyTest
  attr_reader :numbering

  context "always" do
    setup do
      @numbering = Numbering.new
    end

    should "have the right name" do
      assert_equal "numbering", numbering.name
    end

    should "have the right tag" do
      assert_equal :numPr, numbering.tag
    end
  end

  context "for the level property, it" do
    setup do
      @numbering = Numbering.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        numbering.level = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        numbering.level = -24
      end

      assert_raises ArgumentError do
        numbering.level = :big
      end
    end
  end

  context "for the id property, it" do
    setup do
      @numbering = Numbering.new
    end

    should "allow positive integers" do
      assert_nothing_raised do
        numbering.id = 24
      end
    end

    should "not allow anything else" do
      assert_raises ArgumentError do
        numbering.id = -24
      end

      assert_raises ArgumentError do
        numbering.id = :big
      end
    end
  end

  context "with no attributes set, it" do
    setup do
      @numbering = Numbering.new
    end

    should "not output any XML" do
      assert_equal "", xml(numbering)
    end
  end

  context "with valid attributes set, it" do
    setup do
      @numbering = Numbering.new
      numbering.level = 4
      numbering.id = 0
    end

    should "return the correct XML" do
      assert_equal "<w:numPr>\n    <w:ilvl w:val=\"4\"/>\n    <w:numId w:val=\"0\"/>\n  </w:numPr>", xml(numbering)
    end
  end

end
