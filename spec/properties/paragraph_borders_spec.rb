require "spec_helper"

describe OpenXml::Docx::Properties::ParagraphBorders do
  include PropertyTestMacros

  it_should_use tag: :pBdr, name: "borders"

  context "when setting values" do
    before(:each) do
      @instance = described_class.new
    end

    it "should allow modifying the left border" do
      expect { instance.left.color = :auto }.to_not raise_error
    end

    it "should allow modifying the right border" do
      expect { instance.right.size = 24 }.to_not raise_error
    end

    it "should allow modifying the top border" do
      expect { instance.top.space = 1 }.to_not raise_error
    end

    it "should allow modifying the bottom border" do
      expect { instance.bottom.type = :apples }.to_not raise_error
    end

    it "should allow modifying the between border" do
      expect { instance.between.shadow = true }.to_not raise_error
    end

    it "should allow modifying the bar border" do
      expect { instance.bar.theme_color = :accent2 }.to_not raise_error
    end

  end

  context "with no values set" do
    before(:each) do
      @instance = described_class.new
    end

    it_should_output "", assign: false
  end

  context "when one border has at least one property set" do
    before(:each) do
      @instance = described_class.new
      instance.left.type = :apples
    end

    it_should_output "<w:pBdr>\n    <w:left w:val=\"apples\"/>\n  </w:pBdr>", assign: false
  end

  context "when more than one border has at least one property set" do
    before(:each) do
      @instance = described_class.new
      instance.left.color = "FF0000"
      instance.right.type = :apples
    end

    it_should_output "<w:pBdr>\n    <w:left w:color=\"FF0000\"/>\n    <w:right w:val=\"apples\"/>\n  </w:pBdr>", assign: false
  end

end
