require "test_helper"

class ImprintTest < PropertyTest
  attr_reader :imprint

  context "always" do
    setup do
      @imprint = Imprint.new(false)
    end

    should "have the right tag" do
      assert_equal :imprint, imprint.tag
    end

    should "have the right name" do
      assert_equal "imprint", imprint.name
    end
  end

  context "when the value is true, it" do
    setup do
      @imprint = Imprint.new(true)
    end

    should "return XML" do
      assert_equal "<w:imprint/>", xml(imprint)
    end
  end

  context "when the value is false, it" do
    setup do
      @imprint = Imprint.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(imprint)
    end
  end

  context "when the value is nil, it" do
    setup do
      @imprint = Imprint.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(imprint)
    end
  end

end
