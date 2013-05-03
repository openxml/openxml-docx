require 'spec_helper'

describe Rocx::Document do
  let(:document) { Rocx::Document.new }
  %w{app content_types default_core relationships web_settings}.each do |part|
    let("#{part}_part".to_sym) { part_xml(part) }
  end
  
  it "should create the app part XML" do
    document.app.to_xml
    expect(document.app.to_s).to eq(app_part)
  end
  
  it "should create the content types part XML" do
    document.content_types.to_xml
    expect(document.content_types.to_s).to eq(content_types_part)
  end
  
  # !TODO: make this file work! (timestamps)
  # it "should create the default core part XML" do
  #   document.core.to_xml
  #   expect(document.core.to_s).to eq(default_core_part)
  # end
  
  # !TODO: tests for core (meta_data) options -> creator, last_modified_by
  
  it "should create the relationships part XML" do
    document.relationships.to_xml
    expect(document.relationships.to_s).to eq(relationships_part)
  end
  
  it "should create the web settings part XML" do
    document.web_settings.to_xml
    expect(document.web_settings.to_s).to eq(web_settings_part)
  end  
end
