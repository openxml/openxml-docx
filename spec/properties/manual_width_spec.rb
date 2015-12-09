require "spec_helper"

describe OpenXml::Docx::Properties::ManualWidth do
  include PropertyTestMacros

  it_should_use tag: :fitText, name: "manual_width"

  for_attribute(:id) do
    values = [12, -134]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:width) do
    it_should_assign_and_output_xml 12
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(id: 50, width: 720) do
    it_should_output "<w:fitText w:id=\"50\" w:val=\"720\"/>", assign: false
  end

end
