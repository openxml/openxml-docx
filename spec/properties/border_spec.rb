require "spec_helper"

describe Rocx::Properties::Border do
  include PropertyTestMacros

  context "always" do
    before(:each) do
      @instance = described_class.new(:left)
    end

    it "should have the right name" do
      expect(instance.name).to eq("border")
    end

    it "should have its tag be equal to the argument passed on initialize" do
      expect(instance.tag).to eq(:left)
    end
  end

  context "when no tag is specified" do
    before(:each) do
      @instance = described_class.new
      instance.color = "FF00FF"
      instance.type = :crazyMaze
    end

    it "should have its tag be :bdr" do
      expect(instance.tag).to eq(:bdr)
    end

    it_should_output "<w:bdr w:color=\"FF00FF\" w:val=\"crazyMaze\"/>", assign: false
  end

  for_attribute(:color) do
    with_value("4F81BD") do
      it_should_assign_successfully
      it_should_output "<w:bdr w:color=\"4F81BD\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:color=\"auto\"/>"
    end

    with_value(:green) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:frame) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:frame=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end

    with_value(:yep) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:shadow) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:shadow=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end

    with_value(:yep) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:size) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:sz=\"24\"/>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:space) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:space=\"24\"/>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_color) do
    with_value(:hyperlink) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:themeColor=\"hyperlink\"/>"
    end

    with_value(:lens_flare) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_shade) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:bdr w:themeShade=\"BF\"/>"
    end

    with_value(:dark) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_tint) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:bdr w:themeTint=\"BF\"/>"
    end

    with_value(:pink) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    with_value(:single) do
      it_should_assign_successfully
      it_should_output "<w:bdr w:val=\"single\"/>"
    end

    with_value(:programmers) do
      it_should_raise_an_exception
    end
  end

end
