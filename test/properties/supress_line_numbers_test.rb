require "test_helper"

class SupressLineNumbersTest < PropertyTest
  attr_reader :supress_line_numbers

  context "always" do
    setup do
      @supress_line_numbers = Rocx::Properties::SupressLineNumbers.new(false)
    end

    should "have the right tag" do
      assert_equal :supressLineNumbers, supress_line_numbers.tag
    end

    should "have the right name" do
      assert_equal "supress_line_numbers", supress_line_numbers.name
    end
  end

  context "when the value is true, it" do
    setup do
      @supress_line_numbers = Rocx::Properties::SupressLineNumbers.new(true)
    end

    should "return XML" do
      assert_equal "<w:supressLineNumbers/>", xml(supress_line_numbers)
    end
  end

  context "when the value is false, it" do
    setup do
      @supress_line_numbers = Rocx::Properties::SupressLineNumbers.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(supress_line_numbers)
    end
  end

  context "when the value is nil, it" do
    setup do
      @supress_line_numbers = Rocx::Properties::SupressLineNumbers.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(supress_line_numbers)
    end
  end

end
