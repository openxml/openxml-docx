require "spec_helper"

describe OpenXml::Docx::Elements::Hyperlink do
  include ElementTestMacros

  it_should_use tag: :hyperlink, name: "hyperlink"

  with_no_attributes_set do
    it_should_output "<w:hyperlink/>", assign: false
  end

  for_attribute(:id) do
    with_value(23) do
      it_should_assign_successfully
      it_should_output "<w:hyperlink r:id=\"23\"/>"
    end
  end

  context "with children" do
    before do
      @instance = described_class.new
      text = OpenXml::Docx::Elements::Text.new("Smucker's Preserves")
      run = OpenXml::Docx::Elements::Run.new
      run << text
      instance << run
      instance.id = 7346
    end

    it_should_output <<~XML.chomp, assign: false
      <w:hyperlink r:id="7346">
          <w:r>
            <w:t>Smucker's Preserves</w:t>
          </w:r>
        </w:hyperlink>
    XML
  end
end
