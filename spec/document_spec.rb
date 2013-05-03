require 'spec_helper'

describe Rocx::Document do
  let(:document) {Rocx::Document.new}
  let(:app_part) { File.read(File.join(File.dirname(__FILE__), "data", "app_part.xml")) }
  let(:content_types_part) { File.read(File.join(File.dirname(__FILE__), "data", "content_types_part.xml")) }
  let(:default_core_part) { File.read(File.join(File.dirname(__FILE__), "data", "core_part_default.xml")) }
  let(:relationships_part) { File.read(File.join(File.dirname(__FILE__), "data", "relationships_part.xml")) }
  let(:web_settings_part) { File.read(File.join(File.dirname(__FILE__), "data", "web_settings_part.xml")) }
  
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
