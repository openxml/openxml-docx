require "spec_helper"

describe OpenXml::Docx::Elements::BookFoldReversePrinting do
  include ElementTestMacros

  it_should_use tag: :bookFoldRevPrinting, name: "book_fold_reverse_printing"

  for_attribute(:value) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:bookFoldRevPrinting w:val=\"true\"/>"
    end

    with_value("true") do
      it_should_raise_an_exception
    end
  end

end
