require "spec_helper"

describe OpenXml::Docx::Properties::PageSize do
  include PropertyTestMacros

  it_should_use tag: :pgSz, name: "page_size"

  for_attribute(:code) do
    values = [1, -10]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:height) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:orientation) do
    values = %i(portrait landscape)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:width) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(width: 12240, height: 5000, orientation: :landscape) do
    it_should_output "<w:pgSz w:h=\"5000\" w:orient=\"landscape\" w:w=\"12240\"/>", assign: false
  end

end
