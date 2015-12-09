require "spec_helper"

describe OpenXml::Docx::Properties::PaperSource do
  include PropertyTestMacros

  it_should_use tag: :paperSrc, name: "paper_source"

  for_attribute(:first) do
    values = [1, -1]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:other) do
    values = [1, -1]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(first: 1, other: 1) do
    it_should_output "<w:paperSrc w:first=\"1\" w:other=\"1\"/>", assign: false
  end

end
