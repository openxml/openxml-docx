require "spec_helper"

describe Rocx::Style do
  include ElementTestMacros

  it_should_use tag: :style, name: "style"

  for_attribute(:custom) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:style w:customStyle=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<w:style/>"
    end

    with_value(:maybe) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:default) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:style w:default=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<w:style/>"
    end

    with_value(:maybe) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value("A String") do
      it_should_assign_successfully
      it_should_output "<w:style w:styleId=\"A String\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    with_value(:character) do
      it_should_assign_successfully
      it_should_output "<w:style w:type=\"character\"/>"
    end

    with_value(:numbering) do
      it_should_assign_successfully
      it_should_output "<w:style w:type=\"numbering\"/>"
    end

    with_value(:paragraph) do
      it_should_assign_successfully
      it_should_output "<w:style w:type=\"paragraph\"/>"
    end

    with_value(:table) do
      it_should_assign_successfully
      it_should_output "<w:style w:type=\"table\"/>"
    end

    with_value(:plate) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<w:style/>", assign: false
  end

  with_these_attributes_set(type: :paragraph, id: "MyStyle") do
    it_should_output "<w:style w:styleId=\"MyStyle\" w:type=\"paragraph\"/>", assign: false
  end

  it "should be able to have paragraph styles" do
    @instance = Rocx::Style.new
    instance.paragraph.alignment = :start

    expected_xml = "<w:style>\n    <w:pPr>\n      <w:jc w:val=\"start\"/>\n    </w:pPr>\n  </w:style>"
    expect(xml(instance)).to eq(expected_xml)
  end

  it "should be able to have character styles" do
    @instance = Rocx::Style.new
    instance.character.bold = true

    expected_xml = "<w:style>\n    <w:rPr>\n      <w:b/>\n    </w:rPr>\n  </w:style>"
    expect(xml(instance)).to eq(expected_xml)
  end

  it "should be able to have paragraph AND character styles" do
    @instance = Rocx::Style.new
    instance.character.bold = true
    instance.paragraph.alignment = :start

    expected_xml = "<w:style>\n    <w:pPr>\n      <w:jc w:val=\"start\"/>\n    </w:pPr>\n    <w:rPr>\n      <w:b/>\n    </w:rPr>\n  </w:style>"
  end

  it_should_have_value_property :personal_compose, with_value: true
  it_should_have_value_property :personal_reply, with_value: true
  it_should_have_value_property :primary_style, with_value: true
  it_should_have_value_property :semi_hidden, with_value: true
  it_should_have_value_property :style_name, with_value: "GD20Complex"
  it_should_have_value_property :ui_priority, with_value: 10
  it_should_have_value_property :unhide_when_used, with_value: true

end
