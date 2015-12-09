require "spec_helper"

describe OpenXml::Docx::Elements::TableCell do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @instance = described_class.new
      instance.no_wrap = true
    end

    it_should_output_correct_xml
  end

end
