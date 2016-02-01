require "spec_helper"

describe OpenXml::Docx::Elements::CompatibilitySetting do
  include ElementTestMacros

  it_should_use tag: :compatSetting, name: "compatibility_setting"

  for_attribute(:setting_name) do
    with_value("A String") do
      it_should_assign_successfully
      it_should_output "<w:compatSetting w:name=\"A String\"/>"
    end

    with_values([0, :not_a_string]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:uri) do
    with_value("A String") do
      it_should_assign_successfully
      it_should_output "<w:compatSetting w:uri=\"A String\"/>"
    end

    with_values([0, :not_a_string]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:value) do
    with_value("A String") do
      it_should_assign_successfully
      it_should_output "<w:compatSetting w:val=\"A String\"/>"
    end

    with_values([0, :not_a_string]) do
      it_should_raise_an_exception
    end
  end

end
