require "spec_helper"

describe OpenXml::Docx::Properties::HeaderReference do
  include PropertyTestMacros

  it_should_use tag: :headerReference, name: "header_reference"

  for_attribute(:id) do
    with_value("rId25") do
      it_should_assign_successfully
      it_should_output "<w:headerReference r:id=\"rId25\"/>"
    end

    it_should_not_allow_invalid_value
    it_should_not_allow_integers
  end

  for_attribute(:type) do
    values = %i(default even first)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(id: "rId5", type: :default) do
    it_should_output "<w:headerReference r:id=\"rId5\" w:type=\"default\"/>", assign: false
  end

end
