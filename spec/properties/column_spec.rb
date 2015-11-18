require "spec_helper"

describe OpenXml::Docx::Properties::Column do
  include PropertyTestMacros

  it_should_use tag: :col, name: "column", value: [1, 1]

  for_attribute(:space) do
    with_value(2) do
      it_should_assign_successfully 1, 1
      it_should_output "<w:col w:space=\"2\" w:w=\"1\"/>", 1, 1
    end

    it_should_not_allow_floats
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

  for_attribute(:width) do
    with_value(2) do
      it_should_assign_successfully 1, 1
      it_should_output "<w:col w:space=\"1\" w:w=\"2\"/>", 1, 1
    end

    it_should_not_allow_floats
    it_should_not_allow_negative_numbers
    it_should_not_allow_invalid_value
  end

end
