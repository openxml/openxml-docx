require 'spec_helper'

describe Rocx::XmlElements::Paragraph do
  it "should create a paragraph element in the document" do
    paragraph_xml = element_xml('paragraph')
    
    document = Rocx::Document.new do
      body do
        paragraph "This is a very small paragraph; most people wouldn't consider it as such."
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(paragraph_xml)
  end
  
  it "should create a paragraph element with appropriate styles when prompted" do
    styled_paragraph_xml = element_xml('styled_paragraph')
    
    document = Rocx::Document.new do
      body do
        paragraph ["This is a ", ["very ", :bold, :italic], "terrible ", ["API", :underline], "."]
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(styled_paragraph_xml)
  end
end
