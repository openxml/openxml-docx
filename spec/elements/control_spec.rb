require "spec_helper"

describe OpenXml::Docx::Elements::Control do
  include ElementTestMacros

  it_should_use tag: :control, name: "control"

  for_attribute(:id, with_namespace: :r) do
    with_value("rId5") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:unique_name, displays_as: :name, with_namespace: :w) do
    with_value("CheckBox1") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:shape_id, displays_as: :shapeid, with_namespace: :w) do
    with_value("_x0000_s1027") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

end
