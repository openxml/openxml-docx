require 'spec_helper'

describe Rocx::XmlElements::PageBreak do
  it "should create a page break element in the document" do
    page_break_xml = element_xml('page_break')
    
    document = Rocx::Document.new do
      body do
        page_break
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(page_break_xml)
  end
  
  it "should raise an error if given an invalid type" do
    expect {
      document = Rocx::Document.new do
        body do
          page_break type: :banana
        end
      end
    }.to raise_error
  end
end
