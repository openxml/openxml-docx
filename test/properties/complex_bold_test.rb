require "test_helper"

class ComplexBoldTest < PropertyTest
  attr_reader :complex_bold

  context "always" do
    setup do
      @complex_bold = ComplexBold.new(false)
    end

    should "have the right tag" do
      assert_equal :bCs, complex_bold.tag
    end

    should "have the right name" do
      assert_equal "complex_bold", complex_bold.name
    end
  end

  context "when the value is true, it" do
    setup do
      @complex_bold = ComplexBold.new(true)
    end

    should "return XML" do
      assert_equal "<w:bCs/>", xml(complex_bold)
    end
  end

  context "when the value is false, it" do
    setup do
      @complex_bold = ComplexBold.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(complex_bold)
    end
  end

  context "when the value is nil, it" do
    setup do
      @complex_bold = ComplexBold.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(complex_bold)
    end
  end

end
