require "test_helper"

class ConditionalFormattingTest < PropertyTest
  attr_reader :cnf_style

  context "always" do
    setup do
      @cnf_style = ConditionalFormatting.new
    end

    should "have the correct tag" do
      assert_equal :cnfStyle, cnf_style.tag
    end

    should "have the correct name" do
      assert_equal "conditional_formatting", cnf_style.name
    end
  end

  context "trying to set an invalid property" do
    should "raise an error" do
      assert_raises ArgumentError do
        @cnf_style = ConditionalFormatting.new(bad: true)
      end
    end
  end

  context "trying to set an invalid value to a valid property" do
    should "raise an error" do
      assert_raises ArgumentError do
        @cnf_style = ConditionalFormatting.new(even_v: :bad)
      end
    end
  end

  context "with valid properties and values, it" do
    setup do
      @cnf_style = ConditionalFormatting.new(first_row: true, first_column: true, first_row_first_column: true)
    end

    should "render the correct XML" do
      assert_equal "<w:cnfStyle w:first_column=\"true\" w:first_row=\"true\" w:first_row_first_column=\"true\"/>", xml(cnf_style)
    end
  end

end
