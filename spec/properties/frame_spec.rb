require "spec_helper"

describe OpenXml::Docx::Properties::Frame do
  include PropertyTestMacros

  it_should_use tag: :framePr, name: "frame"

  for_attribute(:anchor_lock) do
    it_should_behave_like_a_boolean_attribute
    it_should_not_allow_invalid_value
  end

  for_attribute(:drop_cap) do
    values = %i(drop margin none)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:height) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:horizontal_anchor) do
    values = %i(margin page text)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:height_rule) do
    values = %i(atLeast auto exact)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:horizontal_padding) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:lines) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertical_anchor) do
    values = %i(margin page text)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertical_padding) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:width) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:wrap) do
    values = %i(around auto none notBeside through tight)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:horizontal_position) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:relative_horizontal_position) do
    values = %i(center inside left outside right)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertical_position) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:relative_vertical_position) do
    values = %i(bottom center inline inside outside top)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

end
