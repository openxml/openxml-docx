require "spec_helper"

describe OpenXml::Docx::Properties::Spacing do
  include PropertyTestMacros

  it_should_use tag: :spacing, name: "spacing"

  for_attribute(:after) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:after_auto) do
    values = %i(on off)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:after_lines) do
    values = [24, -24]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

  for_attribute(:before) do
    it_should_assign_and_output_xml 24
    it_should_not_allow_invalid_value
    it_should_not_allow_negative_numbers
  end

  for_attribute(:before_auto) do
    values = %i(on off)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:before_lines) do
    values = [24, -24]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

  for_attribute(:line) do
    values = [24, -24]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

  for_attribute(:line_rule) do
    values = %i(atLeast auto exact)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(line: 276, line_rule: :auto) do
    it_should_output "<w:spacing w:line=\"276\" w:lineRule=\"auto\"/>", assign: false
  end

end
