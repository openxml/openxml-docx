require "spec_helper"

describe OpenXml::Docx::Elements::FontAlternateName do
  include ElementTestMacros

  it_should_use tag: :altName, name: "font_alternate_name"

  for_attribute(:value) do
    with_value("String Font Name") do
      it_should_assign_successfully
      it_should_output "<w:altName w:val=\"String Font Name\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
