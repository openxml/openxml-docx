require "spec_helper"

describe OpenXml::Docx::Elements::FontCharacterSet do
  include ElementTestMacros

  it_should_use tag: :charset, name: "font_character_set"

  for_attribute(:character_set) do
    with_value("String") do
      it_should_assign_successfully
      it_should_output "<w:charset w:characterSet=\"String\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
