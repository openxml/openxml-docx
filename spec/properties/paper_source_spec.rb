require "spec_helper"

describe OpenXml::Docx::Properties::PaperSource do
  include PropertyTestMacros

  it_should_use tag: :paperSrc, name: "paper_source"

  for_attribute(:first) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:paperSrc w:first=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<w:paperSrc w:first=\"-1\"/>"
    end

    with_value(1234.4) do
      it_should_raise_an_exception
    end

    with_value(:one_million) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:other) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:paperSrc w:other=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<w:paperSrc w:other=\"-1\"/>"
    end

    with_value(1234.4) do
      it_should_raise_an_exception
    end

    with_value(:one_million) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(first: 1, other: 1) do
    it_should_output "<w:paperSrc w:first=\"1\" w:other=\"1\"/>", assign: false
  end

end
