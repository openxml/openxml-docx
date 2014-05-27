require "test_helper"

class AutoSpaceDnTest < PropertyTest
  attr_reader :auto_space_dn

  context "always" do
    setup do
      @auto_space_dn = Rocx::Properties::AutoSpaceDn.new(false)
    end

    should "have the right tag" do
      assert_equal :autoSpaceDN, auto_space_dn.tag
    end

    should "have the right name" do
      assert_equal "auto_space_dn", auto_space_dn.name
    end
  end

  context "when the value is true, it" do
    setup do
      @auto_space_dn = Rocx::Properties::AutoSpaceDn.new(true)
    end

    should "return XML" do
      assert_equal "<w:autoSpaceDN w:val=\"true\"/>", xml(auto_space_dn)
    end
  end

  context "when the value is false, it" do
    setup do
      @auto_space_dn = Rocx::Properties::AutoSpaceDn.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(auto_space_dn)
    end
  end

  context "when the value is nil, it" do
    setup do
      @auto_space_dn = Rocx::Properties::AutoSpaceDn.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(auto_space_dn)
    end
  end

end
