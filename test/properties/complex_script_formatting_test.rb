require "test_helper"

class ComplexScriptFormattingTest < PropertyTest
  attr_reader :complex_script_formatting

  context "always" do
    setup do
      @complex_script_formatting = ComplexScriptFormatting.new(false)
    end

    should "have the right tag" do
      assert_equal :cs, complex_script_formatting.tag
    end

    should "have the right name" do
      assert_equal "complex_script_formatting", complex_script_formatting.name
    end
  end

  context "when the value is true, it" do
    setup do
      @complex_script_formatting = ComplexScriptFormatting.new(true)
    end

    should "return XML" do
      assert_equal "<w:cs/>", xml(complex_script_formatting)
    end
  end

  context "when the value is false, it" do
    setup do
      @complex_script_formatting = ComplexScriptFormatting.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(complex_script_formatting)
    end
  end

  context "when the value is nil, it" do
    setup do
      @complex_script_formatting = ComplexScriptFormatting.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(complex_script_formatting)
    end
  end

end
