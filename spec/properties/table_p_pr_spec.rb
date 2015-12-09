require "spec_helper"

describe OpenXml::Docx::Properties::TablePPr do
  include PropertyTestMacros

  it_should_use tag: :tblpPr, name: "table_ppr"

  for_attribute(:bottomFromText) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:horizAnchor) do
    values = %i(margin page text)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:leftFromText) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:rightFromText) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:tblpX) do
    values = [1, -1]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:tblpXSpec) do
    values = %i(center inside left outside right)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:tblpY) do
    values = [1, -1]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:tblpYSpec) do
    values = %i(bottom center inline inside outside top)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:topFromText) do
    it_should_assign_and_output_xml 1
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:vertAnchor) do
    values = %i(margin page text)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

end
