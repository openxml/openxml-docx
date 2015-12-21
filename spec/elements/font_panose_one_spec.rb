require "spec_helper"

describe OpenXml::Docx::Elements::FontPanoseOne do
  include ElementTestMacros

  it_should_use tag: :panose1, name: "font_panose_one"

  for_attribute(:value) do
    with_value("ABCDE1234567890") do
      it_should_assign_successfully
      it_should_output "<w:panose1 w:val=\"ABCDE1234567890\"/>"
    end

    with_value("Not a string of hex digits") do
      it_should_raise_an_exception
    end
  end

end
