require "spec_helper"

describe Rocx::Style do
  include StyleTestMacros

  context "when given paragraph styles" do
    before(:each) do
      paragraph_styles = {
        "w:ind" => {"w:firstLine" => "0", "w:left" => "0", "w:right" => "0"},
        "w:jc" => {"w:val" => "left"}
      }
      @style = described_class.new("coolStyle", "paragraph", {}, paragraph_styles)
    end

    it_should_output_correct_xml style_xml: "paragraph"
  end

  context "when given run styles" do
    before(:each) do
      run_styles = {
        "w:rFonts" => {"w:ascii" => "Times New Roman", "w:cs" => "Times New Roman", "w:hAnsi" => "Times New Roman"},
        "w:color" => {"w:val" => "FF0000"},
        "w:sz" => {"w:val" => "20"},
        "w:b" => {"w:val" => "0"},
        "w:i" => {"w:val" => "0"},
        "w:u" => {"w:val" => "none"}
      }
      @style = described_class.new("anotherCoolStyle", "character", run_styles)
    end

    it_should_output_correct_xml style_xml: "character"
  end

end
