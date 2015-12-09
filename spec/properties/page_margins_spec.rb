require "spec_helper"

describe OpenXml::Docx::Properties::PageMargins do
  include PropertyTestMacros

  it_should_use tag: :pgMar, name: "page_margins"

  for_attribute(:bottom) do
    values = [1440, -1440]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:footer) do
    it_should_assign_and_output_xml 1440
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:gutter) do
    it_should_assign_and_output_xml 1440
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:header) do
    it_should_assign_and_output_xml 1440
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:left) do
    it_should_assign_and_output_xml 1440
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:right) do
    it_should_assign_and_output_xml 1440
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:top) do
    values = [1440, -1440]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(header: 720, bottom: 1440, top: 1440, right: 1440, left: 1440, footer: 720, gutter: 0) do
    it_should_output "<w:pgMar w:bottom=\"1440\" w:footer=\"720\" w:gutter=\"0\" w:header=\"720\" w:left=\"1440\" w:right=\"1440\" w:top=\"1440\"/>", assign: false
  end
end
