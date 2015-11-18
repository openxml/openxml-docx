require "spec_helper"

describe OpenXml::Docx::Properties::ConditionalFormatting do
  include PropertyTestMacros

  it_should_use tag: :cnfStyle, name: "conditional_formatting"

  for_attribute(:even_horizontal_band) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:even_vertical_band) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:first_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:first_row) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:first_row_first_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:first_row_last_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:last_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:last_row) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:last_row_first_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:last_row_last_column) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:odd_horizontal_band) do
    it_should_behave_like_a_boolean_attribute
  end

  for_attribute(:odd_vertical_band) do
    it_should_behave_like_a_boolean_attribute
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(last_row: true, last_column: true, last_row_last_column: true) do
    it_should_output "<w:cnfStyle w:lastColumn=\"true\" w:lastRow=\"true\" w:lastRowLastColumn=\"true\"/>", assign: false
  end

end
