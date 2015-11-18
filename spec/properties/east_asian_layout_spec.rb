require "spec_helper"

describe OpenXml::Docx::Properties::EastAsianLayout do
  include PropertyTestMacros

  it_should_use tag: :eastAsianLayout, name: "east_asian_layout"

  for_attribute(:combine) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combine=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combine=\"off\"/>"
    end

    it_should_not_allow_invalid_value
  end

  for_attribute(:combine_brackets) do
    values = %i(angle curly none round square)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:id) do
    values = [1, -81238123]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertical) do
    values = %i(on off)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertical_compress) do
    values = %i(on off)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(id: 2, vertical: :on, vertical_compress: :on) do
    it_should_output "<w:eastAsianLayout w:id=\"2\" w:vert=\"on\" w:vertCompress=\"on\"/>", assign: false
  end

end
