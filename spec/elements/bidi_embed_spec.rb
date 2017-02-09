require "spec_helper"

describe OpenXml::Docx::Elements::BidiEmbed do
  include ElementTestMacros

  it_should_use tag: :dir, name: "bidi_embed"

  for_attribute(:direction) do
    with_value(:rtl) do
      it_should_assign_successfully
      it_should_output "<w:dir w:val=\"rtl\"/>"
    end

    with_value(:ltr) do
      it_should_assign_successfully
      it_should_output "<w:dir w:val=\"ltr\"/>"
    end

    with_value(:not_allowed) do
      it_should_raise_an_exception
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

    it_should_output "<w:dir>\n    <w:r>\n      <w:t>Smucker&apos;s Preserves</w:t>\n    </w:r>\n  </w:dir>", assign: false
  end
end
