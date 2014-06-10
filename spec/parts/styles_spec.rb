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
      paragraph_styles = {
        "w:ind" => {"w:firstLine" => "0", "w:left" => "0", "w:right" => "0"},
        "w:jc" => {"w:val" => "left"}
      }
      style = Rocx::Style.new("coolStyle", "paragraph", {}, paragraph_styles)
      doc << style
    end

    it_should_output_correct_xml part: "styles_with_custom_style"
  end
end
