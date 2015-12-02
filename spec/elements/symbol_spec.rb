require "spec_helper"

describe OpenXml::Docx::Elements::Symbol do
  include ElementTestMacros

  it_should_use tag: :sym, name: "symbol"

  for_attribute(:font, with_namespace: :w) do
    with_value("Wingdings") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(123) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:character, with_namespace: :w, displays_as: :char) do
    with_value("43FD") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("43gg") do
      it_should_raise_an_exception
    end

  end

end
