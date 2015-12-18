require "spec_helper"

describe OpenXml::Docx::Elements::SaveSubsetFonts do
  include ElementTestMacros

  it_should_use tag: :saveSubsetFonts, name: "save_subset_fonts"

  for_attribute(:value) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:saveSubsetFonts w:val=\"true\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
