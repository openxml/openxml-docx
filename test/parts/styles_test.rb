require "test_helper"

class StylesTest < Test::Unit::TestCase
  attr_reader :styles

  context "transforming to XML" do
    should "output the correct XML" do
      @styles = Rocx::Parts::Styles.new
      assert_equal part_xml('styles').strip, styles.to_xml
    end
  end

end
