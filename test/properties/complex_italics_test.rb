require "test_helper"

class ComplexItalicsTest < PropertyTest
  attr_reader :complex_italics

  context "always" do
    setup do
      @complex_italics = ComplexItalics.new(false)
    end

    should "have the right tag" do
      assert_equal :iCs, complex_italics.tag
    end

    should "have the right name" do
      assert_equal "complex_italics", complex_italics.name
    end
  end

  context "when the value is true, it" do
    setup do
      @complex_italics = ComplexItalics.new(true)
    end

    should "return XML" do
      assert_equal "<w:iCs/>", xml(complex_italics)
    end
  end

  context "when the value is false, it" do
    setup do
      @complex_italics = ComplexItalics.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(complex_italics)
    end
  end

  context "when the value is nil, it" do
    setup do
      @complex_italics = ComplexItalics.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(complex_italics)
    end
  end

end
