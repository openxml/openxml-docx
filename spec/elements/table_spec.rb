require 'spec_helper'

describe Rocx::XmlElements::Table do
  it "should create a table in the document" do
    table_xml = element_xml('table')
    
    document = Rocx::Document.new do
      body do
        table [
          ["Luke", "Awesome"],
          ["Gene", "Awesome"],
          ["Jesse", "Nope"],
          ["Bob", "Nope"]
        ]
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(table_xml)
  end
  
  it "should create a table with borders when enabled" do
    bordered_table_xml = element_xml('bordered_table')
    
    document = Rocx::Document.new do
      body do
        table [
          ["I", "have", "borders"]
        ], borders: true, border_type: 'wave', border_color: "#dfdfdf"
      end
    end
    
    document.document.to_xml
    expect(document.document.to_s).to eq(bordered_table_xml)
  end
end
