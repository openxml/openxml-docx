require "spec_helper"

describe OpenXml::Docx::Elements::BookFoldPrintingSheets do
  include ElementTestMacros

  it_should_use tag: :bookFoldPrintingSheets, name: "book_fold_printing_sheets"

  for_attribute(:value) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:bookFoldPrintingSheets w:val=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end

    with_value(1.1) do
      it_should_raise_an_exception
    end

    with_value(:not_a_number) do
      it_should_raise_an_exception
    end
  end

end
