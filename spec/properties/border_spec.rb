require "spec_helper"

describe OpenXml::Docx::Properties::Border do
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
    values = ["4581BD", :auto]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:frame) do
    it_should_behave_like_a_boolean_attribute
    it_should_not_allow_invalid_value
  end

  for_attribute(:shadow) do
    it_should_behave_like_a_boolean_attribute
    it_should_not_allow_invalid_value
  end

  for_attribute(:size) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:space) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_color) do
    it_should_assign_and_output_xml :hyperlink
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_shade) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_tint) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:type) do
    it_should_assign_and_output_xml :single
    it_should_not_allow_invalid_value
  end

end
