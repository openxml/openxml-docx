require 'spec_helper'

describe Rocx::XmlElements::Bullet do
  bullet_xml = element_xml("bullet")
  indented_bullet_xml = element_xml("indented_bullet")
  
  it "should create a paragraph of ListBullet type" do
    document = Rocx::Document.new do
      body do
        bullet "Bob"
        bullet "Luke"
        bullet "Jesse"
        bullet "Kendall"
        bullet "Ordie"
        bullet "And the rest"
      end
    end
    document.document.to_xml
    expect(document.document.to_s).to eq(bullet_xml)
  end
  
  # !TODO: 
  # it "should create bullets with different styles" do
  #   document = Rocx::Document.new do
  #     body do
  #       bullet "Color blob", style: 14
  #     end
  #   end
  #   
  #   document.document.to_xml
  #   expect(document.document.to_s).should eq(styled_bullet_xml)
  # end
  
  it "should create bullets with different indent levels" do
    document = Rocx::Document.new do
      body do
        bullet "Red", level: 0
        bullet "Green", level: 0
        bullet "Yellow", level: 1
        bullet "Black", level: 2
        bullet "Orange", level: 0
      end
    end
    document.document.to_xml
    expect(document.document.to_s).to eq(indented_bullet_xml)
  end
end
