require "spec_helper"

describe OpenXml::Docx::Properties::TableRowHeight do
  include PropertyTestMacros

  it_should_use tag: :trHeight, name: "table_row_height"

  for_attribute(:hRule) do
    values = %i(auto atLeast exact)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:val) do
    it_should_assign_and_output_xml 2
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

end
