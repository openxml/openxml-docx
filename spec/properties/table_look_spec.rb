require "spec_helper"

describe OpenXml::Docx::Properties::TableLook do
  include PropertyTestMacros

  it_should_use tag: :tblLook, name: "table_look"

  for_attribute(:firstColumn) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

  for_attribute(:firstRow) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

  for_attribute(:lastColumn) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

  for_attribute(:lastRow) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

  for_attribute(:noHBand) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

  for_attribute(:noVBand) do
    it_should_assign_and_output_xml true
    it_should_not_allow_invalid_value
  end

end
