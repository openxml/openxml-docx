require "test_helper"

class KeepLinesTest < PropertyTest
  attr_reader :keep_lines

  context "always" do
    setup do
      @keep_lines = Rocx::Properties::KeepLines.new(false)
    end

    should "have the right tag" do
      assert_equal :keepLines, keep_lines.tag
    end

    should "have the right name" do
      assert_equal "keep_lines", keep_lines.name
    end
  end

  context "when the value is true, it" do
    setup do
      @keep_lines = Rocx::Properties::KeepLines.new(true)
    end

    should "return XML" do
      assert_equal "<w:keepLines/>", xml(keep_lines)
    end
  end

  context "when the value is false, it" do
    setup do
      @keep_lines = Rocx::Properties::KeepLines.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(keep_lines)
    end
  end

  context "when the value is nil, it" do
    setup do
      @keep_lines = Rocx::Properties::KeepLines.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(keep_lines)
    end
  end

end
