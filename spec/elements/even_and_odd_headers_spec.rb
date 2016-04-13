require "spec_helper"

describe OpenXml::Docx::Elements::EvenAndOddHeaders do
  include ElementTestMacros

  it_should_use tag: :evenAndOddHeaders, name: "even_and_odd_headers"

  with_no_attributes_set do
    it_should_output "<w:evenAndOddHeaders/>", assign: false
  end

  for_attribute(:value) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:evenAndOddHeaders w:val=\"true\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
