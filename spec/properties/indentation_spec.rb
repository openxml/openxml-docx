require "spec_helper"

describe OpenXml::Docx::Properties::Indentation do
  include PropertyTestMacros

  it_should_use tag: :ind, name: "indentation"

  for_attribute(:end) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:end_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:first_line) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:first_line_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:hanging) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:hanging_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:left) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:left_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:right) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:right_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:start) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:start_characters) do
    values = [1220, -1220]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(start_characters: 44, hanging: 1200) do
    it_should_output "<w:ind w:hanging=\"1200\" w:startChars=\"44\"/>", assign: false
  end

end
