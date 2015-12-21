require "spec_helper"

describe OpenXml::Docx::Elements::EmbedSystemFonts do
  include ElementTestMacros

  it_should_use tag: :embedSystemFonts, name: "embed_system_fonts"

  for_attribute(:value) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:embedSystemFonts w:val=\"true\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
