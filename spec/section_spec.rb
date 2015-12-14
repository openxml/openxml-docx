require "spec_helper"

describe OpenXml::Docx::Section do
  include ElementTestMacros

  it_should_have_property :columns
  it_should_have_property :document_grid
  it_should_have_property :footer_reference
  it_should_have_property :header_reference
  it_should_have_property :line_numbering
  it_should_have_property :page_margins
  it_should_have_property :page_borders
  it_should_have_property :page_numbering
  it_should_have_property :page_size
  it_should_have_property :paper_source

  it_should_have_value_property :bidi
  it_should_have_value_property :form_protection
  it_should_have_value_property :rtl_gutter
  it_should_have_value_property :text_direction, with_value: :lr
  it_should_have_value_property :type, as_instance_of: :section_type, with_value: :oddPage
  it_should_have_value_property :vertical_alignment, as_instance_of: :vertical_text_alignment, with_value: :both

  context "if no attribute are set" do
    before(:each) do
      @instance = described_class.new
    end

    it "should output nothing" do
      expect(xml(instance)).to eq("")
    end
  end

  context "if there are properties set" do
    before(:each) do
      @instance = described_class.new
      instance.bidi = true
      instance.columns << OpenXml::Docx::Properties::Column.new(1, 1)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:sectPr>\n    <w:cols>\n      <w:col w:space=\"1\" w:w=\"1\"/>\n    </w:cols>\n    <w:bidi/>\n  </w:sectPr>")
    end
  end

end
