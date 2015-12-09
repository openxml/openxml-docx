require "spec_helper"

describe OpenXml::Docx::Properties::LineNumbering do
  include PropertyTestMacros

  it_should_use tag: :lnNumType, name: "line_numbering"

  for_attribute(:count_by) do
    values = [5, -5]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:distance) do
    it_should_assign_and_output_xml 720
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:restart) do
    values = %i(continuous newPage newSection)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:start) do
    values = [5, -5]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(start: 3, count_by: 5) do
    it_should_output "<w:lnNumType w:countBy=\"5\" w:start=\"3\"/>", assign: false
  end

end
