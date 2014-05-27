require "test_helper"

class AutoSpaceDeTest < PropertyTest
  attr_reader :auto_space_de

  context "always" do
    setup do
      @auto_space_de = Rocx::Properties::AutoSpaceDe.new(false)
    end

    should "have the right tag" do
      assert_equal :autoSpaceDE, auto_space_de.tag
    end

    should "have the right name" do
      assert_equal "auto_space_de", auto_space_de.name
    end
  end

  context "when the value is true, it" do
    setup do
      @auto_space_de = Rocx::Properties::AutoSpaceDe.new(true)
    end

    should "return XML" do
      assert_equal "<w:autoSpaceDE w:val=\"true\"/>", xml(auto_space_de)
    end
  end

  context "when the value is false, it" do
    setup do
      @auto_space_de = Rocx::Properties::AutoSpaceDe.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(auto_space_de)
    end
  end

  context "when the value is nil, it" do
    setup do
      @auto_space_de = Rocx::Properties::AutoSpaceDe.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(auto_space_de)
    end
  end

end
