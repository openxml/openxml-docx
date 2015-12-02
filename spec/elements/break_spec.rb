require "spec_helper"

describe OpenXml::Docx::Elements::Break do
  include ElementTestMacros

  it_should_use tag: :br, name: "break"

  for_attribute(:clear, with_namespace: :w) do
    allowed = %i(all left none right)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type, with_namespace: :w) do
    allowed = %i(column page textWrapping)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
