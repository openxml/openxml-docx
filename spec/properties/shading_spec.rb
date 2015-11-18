require "spec_helper"

describe OpenXml::Docx::Properties::Shading do
  include PropertyTestMacros

  it_should_use tag: :shd, name: "shading"

  for_attribute(:color) do
    values = ["4F818D", :auto]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:fill) do
    values = ["4F818D", :auto]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_color) do
    it_should_assign_and_output_xml :hyperlink
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_fill) do
    it_should_assign_and_output_xml :hyperlink
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_fill_shade) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_fill_tint) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_shade) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_tint) do
    it_should_assign_and_output_xml "BF"
    it_should_not_allow_invalid_value
  end

  for_attribute(:pattern) do
    values = %i(pct90 solid vertStripe)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(pattern: :pct20, theme_color: :accent6, theme_fill: :accent3) do
    it_should_output "<w:shd w:themeColor=\"accent6\" w:themeFill=\"accent3\" w:val=\"pct20\"/>", assign: false
  end

end
