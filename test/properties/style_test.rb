require "test_helper"

class StylePropertyTest < PropertyTest
  attr_reader :style

  context "always" do
    setup do
      @style = Style.new("Nope Style 1")
    end

    should "set the right tag" do
      assert_equal :pStyle, style.tag
    end

    should "set the right name" do
      assert_equal "style", style.name
    end
  end

  context "with a valid style" do
    setup do
      @style = Style.new("Nope Style 1")
    end

    should "return the proper XML" do
      assert_equal "<w:pStyle w:val=\"Nope Style 1\"/>", xml(style)
    end
  end

end
