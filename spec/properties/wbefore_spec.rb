require "spec_helper"

describe OpenXml::Docx::Properties::WBefore do
  include PropertyTestMacros

  it_should_use tag: :wBefore, name: "w_before"

  for_attribute(:type) do
    values = %i(auto dxa nil pct)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
    it_should_not_allow_integers
  end

  for_attribute(:width) do
    it_should_assign_and_output_xml 2
    it_should_not_allow_invalid_value
    it_should_not_allow_floats
  end

end
