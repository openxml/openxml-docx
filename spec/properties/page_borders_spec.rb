require "spec_helper"

describe Rocx::Properties::PageBorders do
  include PropertyTestMacros

  it_should_use tag: :pgBorders, name: "page_borders"

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

  end

  for_attribute(:display) do
    before(:each) do
      @instance = described_class.new
    end

    it "should accept the value :allPages" do
      expect { instance.send("#{attribute}=", :allPages) }.to_not raise_error
      instance.send "#{attribute}=", :allPages
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:display=\"allPages\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end

    it "should accept the value :firstPage" do
      expect { instance.send("#{attribute}=", :firstPage) }.to_not raise_error
      instance.send "#{attribute}=", :firstPage
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:display=\"firstPage\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end

    it "should accept the value :notFirstPage" do
      expect { instance.send("#{attribute}=", :notFirstPage) }.to_not raise_error
      instance.send "#{attribute}=", :notFirstPage
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:display=\"notFirstPage\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end
  end

  for_attribute(:offset_from) do
    before(:each) do
      @instance = described_class.new
    end

    it "should accept the value :page" do
      expect { instance.send("#{attribute}=", :page) }.to_not raise_error
      instance.send "#{attribute}=", :page
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:offsetFrom=\"page\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end

    it "should accept the value :text" do
      expect { instance.send("#{attribute}=", :text) }.to_not raise_error
      instance.send "#{attribute}=", :text
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:offsetFrom=\"text\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end
  end

  for_attribute(:z_order) do
    before(:each) do
      @instance = described_class.new
    end

    it "should accept the value :back" do
      expect { instance.send("#{attribute}=", :back) }.to_not raise_error
      instance.send "#{attribute}=", :back
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:zOrder=\"back\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end

    it "should accept the value :front" do
      expect { instance.send("#{attribute}=", :front) }.to_not raise_error
      instance.send "#{attribute}=", :front
      instance.left.color = :auto
      expect(xml(instance)).to eq("<w:pgBorders w:zOrder=\"front\">\n    <w:left w:color=\"auto\"/>\n  </w:pgBorders>")
    end

    with_value(:side) do
      it_should_raise_an_exception
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

    it_should_output "<w:pgBorders>\n    <w:left w:val=\"apples\"/>\n  </w:pgBorders>", assign: false
  end

  context "when more than one border has at least one property set" do
    before(:each) do
      @instance = described_class.new
      instance.left.color = "FF0000"
      instance.right.type = :apples
    end

    it_should_output "<w:pgBorders>\n    <w:left w:color=\"FF0000\"/>\n    <w:right w:val=\"apples\"/>\n  </w:pgBorders>", assign: false
  end

end
