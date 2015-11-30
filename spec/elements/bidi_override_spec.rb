require "spec_helper"

describe OpenXml::Docx::Elements::BidiOverride do
  include ElementTestMacros

  it_should_use tag: :bdo, name: "bidi_override"

  for_attribute(:direction) do
    with_value(:rtl) do
      it_should_assign_successfully
      it_should_output "<w:bdo w:val=\"rtl\"/>"
    end

    with_value(:ltr) do
      it_should_assign_successfully
      it_should_output "<w:bdo w:val=\"ltr\"/>"
    end
  end

  context "with children" do
    before(:each) do
      @instance = described_class.new
      text = OpenXml::Docx::Elements::Text.new("Smucker's Preserves")
      run = OpenXml::Docx::Elements::Run.new
      run << text
      instance << run
    end

    it_should_output "<w:bdo>\n    <w:r>\n      <w:t>Smucker's Preserves</w:t>\n    </w:r>\n  </w:bdo>", assign: false
  end
end
