require "spec_helper"

describe OpenXml::Docx::Elements::ContentPart do
  include ElementTestMacros

  it_should_use tag: :contentPart, name: "content_part"

  for_attribute(:id, with_namespace: :r) do
    with_value("rId8") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end
end
