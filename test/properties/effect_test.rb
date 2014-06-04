require "test_helper"

class EffectTest < PropertyTest
  attr_reader :effect

  context "always" do
    setup do
      @effect = Effect.new(:none)
    end

    should "have the right name" do
      assert_equal "effect", effect.name
    end

    should "have the right tag" do
      assert_equal :effect, effect.tag
    end
  end

  context "with a valid value, it" do
    setup do
      @effect = Effect.new(:antsBlack)
    end

    should "output the correct XML" do
      assert_equal "<w:effect w:val=\"antsBlack\"/>", xml(effect)
    end
  end

  context "with an invalid value, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @effect = Effect.new(:energize)
      end
    end
  end

end
