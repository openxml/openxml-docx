require "test_helper"

class StylesTest < Test::Unit::TestCase
  attr_reader :styles

  context "adding a custom style" do
    setup do
      paragraph_styles = {
        "w:ind" => {"w:firstLine" => "0", "w:left" => "0", "w:right" => "0"},
        "w:jc" => {"w:val" => "left"}
      }
      style = Rocx::Style.new("coolStyle", "paragraph", {}, paragraph_styles)
      @styles = Rocx::Parts::Styles.new
      styles << style
    end

    should "output the style in the generated XML" do
      assert_equal part_xml("styles_with_custom_style").strip, styles.read
    end
  end

  context "transforming to XML" do
    should "output the correct XML" do
      @styles = Rocx::Parts::Styles.new
      assert_equal part_xml('styles').strip, styles.read
    end
  end

end
