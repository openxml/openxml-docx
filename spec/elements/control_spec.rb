require "spec_helper"

describe OpenXml::Docx::Elements::Control do
  include ElementTestMacros

  it_should_use tag: :control, name: "control"

  for_attribute(:id) do
    with_value("rId5") do
      it_should_assign_successfully
      it_should_output "<w:control r:id=\"rId5\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:unique_name) do
    with_value("CheckBox1") do
      it_should_assign_successfully
      it_should_output "<w:control w:name=\"CheckBox1\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:shape_id, displays_as: :shapeid, with_namespace: :w) do
    with_value("_x0000_s1027") do
      it_should_assign_successfully
      it_should_output "<w:control w:shapeid=\"_x0000_s1027\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

end
