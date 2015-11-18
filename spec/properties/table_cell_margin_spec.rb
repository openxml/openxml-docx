require "spec_helper"

describe OpenXml::Docx::Properties::TableCellMargin do
  include PropertyTestMacros

  context "with an invalid tag provided" do
    it "should raise an exception" do
      expect do
        described_class.new :overthetop
      end.to raise_error(ArgumentError)
    end
  end

  for_attribute(:type) do
    with_value(:dxa) do
      it_should_assign_successfully :bottom
      it_should_output "<w:bottom w:type=\"dxa\"/>", :bottom
    end

    with_value(:pct) do
      it_should_assign_successfully :bottom
      it_should_output "<w:bottom w:type=\"pct\"/>", :bottom
    end

    it_should_not_allow_invalid_value
    it_should_not_allow_integers
  end

  for_attribute(:width) do
    with_value(2) do
      it_should_assign_successfully :bottom
      it_should_output "<w:bottom w:w=\"2\"/>", :bottom
    end

    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

end
