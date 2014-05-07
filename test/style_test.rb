require "test_helper"

class StyleTest < Test::Unit::TestCase
  attr_reader :style

  context "when given paragraph styles" do
    setup do
      paragraph_styles = {
        "w:ind" => {"w:firstLine" => "0", "w:left" => "0", "w:right" => "0"},
        "w:jc" => {"w:val" => "left"}
      }
      @style = Rocx::Style.new("coolStyle", "paragraph", {}, paragraph_styles)
    end

    should "generate the appropriate style XML" do
      xml = build_xml do |xml|
        style.build_xml(xml)
      end
      assert_equal style_xml("paragraph"), xml, "Expected the generated style XML to match"
    end
  end

  context "when given run styles" do
    setup do
      run_styles = {
        "w:rFonts" => {"w:ascii" => "Times New Roman", "w:cs" => "Times New Roman", "w:hAnsi" => "Times New Roman"},
        "w:color" => {"w:val" => "FF0000"},
        "w:sz" => {"w:val" => "20"},
        "w:b" => {"w:val" => "0"},
        "w:i" => {"w:val" => "0"},
        "w:u" => {"w:val" => "none"}
      }
      @style = Rocx::Style.new("anotherCoolStyle", "character", run_styles)
    end

    should "generate the appropriate style XML" do
      xml = build_xml do |xml|
        style.build_xml(xml)
      end
      assert_equal style_xml("character"), xml, "Expected the generated style XML to match"
    end
  end

private

  def build_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.styleFoo("xmlns:w" => "http://wnamespace.com") {
        yield xml
      }
    end.to_xml
  end

end
