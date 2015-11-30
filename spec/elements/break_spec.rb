require "spec_helper"

describe OpenXml::Docx::Elements::Break do
  include ElementTestMacros

  it_should_use tag: :br, name: "break"

  for_attribute(:clear) do
    with_value(:all) do
      it_should_assign_successfully
      it_should_output "<w:br w:clear=\"all\"/>"
    end

    with_value(:left) do
      it_should_assign_successfully
      it_should_output "<w:br w:clear=\"left\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:br w:clear=\"none\"/>"
    end

    with_value(:right) do
      it_should_assign_successfully
      it_should_output "<w:br w:clear=\"right\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    with_value(:column) do
      it_should_assign_successfully
      it_should_output "<w:br w:type=\"column\"/>"
    end

    with_value(:page) do
      it_should_assign_successfully
      it_should_output "<w:br w:type=\"page\"/>"
    end

    with_value(:textWrapping) do
      it_should_assign_successfully
      it_should_output "<w:br w:type=\"textWrapping\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
