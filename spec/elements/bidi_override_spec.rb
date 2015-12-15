require "spec_helper"

describe OpenXml::Docx::Elements::BidiOverride do
  include ElementTestMacros

  it_should_use tag: :bdo, name: "bidi_override"

  for_attribute(:direction, displays_as: :val, with_namespace: :w) do
    allowed = %i(rtl ltr)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
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
