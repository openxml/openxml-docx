require "spec_helper"

describe OpenXml::Docx::Elements::GridColumn do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @instance = described_class.new
      instance.w = 1
    end

    it_should_output_correct_xml
  end

end
