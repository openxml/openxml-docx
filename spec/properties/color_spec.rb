require "spec_helper"

describe OpenXml::Docx::Properties::Color do
  include PropertyTestMacros

  it_should_use tag: :color, name: "color"

  for_attribute(:theme_color) do
    it_should_assign_and_output_xml :hyperlink
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

  for_attribute(:color) do
    values = %i(D99694 auto)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

end
