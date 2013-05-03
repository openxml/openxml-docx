require 'spec_helper'

describe Rocx::XmlElements::Heading do
  it "shoudl create a heading element" do
    heading_xml = element_xml('heading')
    
    document = Rocx::Document.new do
      body do
        heading "TPS Report", 1
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(heading_xml)
  end
end
