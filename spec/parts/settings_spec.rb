require "spec_helper"

describe OpenXml::Docx::Parts::Settings do
  include PartTestMacros

  context "always" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml
  end
end
