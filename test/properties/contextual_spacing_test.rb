require "test_helper"

class ContextualSpacingTest < PropertyTest
  attr_reader :contextual_spacing

  context "always" do
    setup do
      @contextual_spacing = Rocx::Properties::ContextualSpacing.new(false)
    end

    should "have the right tag" do
      assert_equal :contextualSpacing, contextual_spacing.tag
    end

    should "have the right name" do
      assert_equal "contextual_spacing", contextual_spacing.name
    end
  end

  context "when the value is true, it" do
    setup do
      @contextual_spacing = Rocx::Properties::ContextualSpacing.new(true)
    end

    should "return XML" do
      assert_equal "<w:contextualSpacing/>", xml(contextual_spacing)
    end
  end

  context "when the value is false, it" do
    setup do
      @contextual_spacing = Rocx::Properties::ContextualSpacing.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(contextual_spacing)
    end
  end

  context "when the value is nil, it" do
    setup do
      @contextual_spacing = Rocx::Properties::ContextualSpacing.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(contextual_spacing)
    end
  end

end
