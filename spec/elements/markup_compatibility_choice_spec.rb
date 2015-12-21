require "spec_helper"

describe OpenXml::Docx::Elements::MarkupCompatibilityChoice do
  include ElementTestMacros

  it_should_use tag: :Choice, name: "markup_compatibility_choice"

  with_no_attributes_set do
    it_should_output "<mc:Choice/>", assign: false
  end

  for_attribute(:requires, displays_as: :Requires) do
    with_value("wps") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end
end
