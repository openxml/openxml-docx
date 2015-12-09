require "spec_helper"

describe OpenXml::Docx::Properties::Underline do
  include PropertyTestMacros

  it_should_use tag: :u, name: "underline"

  for_attribute(:color) do
    values = ["FF34E1", :auto]
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:theme_color) do
    it_should_assign_and_output_xml :accent3
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

  for_attribute(:type) do
    values = %i(dash dashDotDotHeavy dashDotDotHeavy dashedHeavy dashLong dashLongHeavy
                dotDash dotDotDash dotted dottedHeavy double none single thick wave
                wavyDouble wavyHeavy words)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(color: "95B3D7", theme_color: :accent2, theme_tint: "99") do
    it_should_output "<w:u w:color=\"95B3D7\" w:themeColor=\"accent2\" w:themeTint=\"99\"/>", assign: false
  end

end
