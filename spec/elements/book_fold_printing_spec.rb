require "spec_helper"

describe OpenXml::Docx::Elements::BookFoldPrinting do
  include ElementTestMacros

  it_should_use tag: :bookFoldPrinting, name: "book_fold_printing"

  for_attribute(:value) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:bookFoldPrinting w:val=\"true\"/>"
    end

    with_value("true") do
      it_should_raise_an_exception
    end
  end

end
