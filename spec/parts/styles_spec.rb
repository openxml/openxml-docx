require "spec_helper"

describe Rocx::Parts::Styles do
  include PartTestMacros

  context "when adding no additional styles" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml
  end

  context "after adding additional styles" do
    before(:each) do
      @doc = described_class.new

      style = Rocx::Style.new
      style.id = "coolStyle"
      style.type = :paragraph
      style.paragraph.alignment = :start

      doc << style
    end

    it_should_output_correct_xml part: "styles_with_custom_style"
  end
end
