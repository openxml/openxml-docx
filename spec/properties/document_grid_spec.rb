require "spec_helper"

describe OpenXml::Docx::Properties::DocumentGrid do
  include PropertyTestMacros

  it_should_use tag: :docGrid, name: "document_grid"

  for_attribute(:char_space) do
    values = [40960, -12345]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

  for_attribute(:line_pitch) do
    values = [40960, -12345]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

  for_attribute(:type) do
    values = %i(default lines linesAndChars snapToChars)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(char_space: 40960, line_pitch: 40960, type: :default) do
    it_should_output "<w:docGrid w:charSpace=\"40960\" w:linePitch=\"40960\" w:type=\"default\"/>", assign: false
  end

end
