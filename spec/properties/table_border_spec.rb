require "spec_helper"

describe OpenXml::Docx::Properties::TableBorder do
  include PropertyTestMacros

  context "always" do
    before(:each) do
      @instance = described_class.new(:bottom, :babyPacifier)
    end

    it "should have the right name" do
      expect(instance.name).to eq("table_border")
    end

    it "should have its tag be equal to the argument passed on initialize" do
      expect(instance.tag).to eq(:bottom)
    end
  end

  for_attribute(:color) do
    with_value("4F81BD") do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:color=\"4F81BD\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    with_value(:auto) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:color=\"auto\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:frame) do
    with_value(true) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:frame=\"true\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    with_value(false) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:shadow) do
    with_value(true) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:shadow=\"true\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    with_value(false) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:width) do
    with_value(24) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:val=\"babyPacifier\" w:sz=\"24\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:space) do
    with_value(24) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:space=\"24\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_color) do
    with_value(:hyperlink) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:themeColor=\"hyperlink\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_shade) do
    with_value("BF") do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:themeShade=\"BF\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_tint) do
    with_value("BF") do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:themeTint=\"BF\" w:val=\"babyPacifier\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:value) do
    with_value(:single) do
      it_should_assign_successfully :bottom, :babyPacifier
      it_should_output "<w:bottom w:val=\"single\"/>", :bottom, :babyPacifier
    end

    it_should_not_allow_invalid_value
  end


end
