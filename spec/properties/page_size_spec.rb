require "spec_helper"

describe OpenXml::Docx::Properties::PageSize do
  include PropertyTestMacros

  it_should_use tag: :pgSz, name: "page_size"

  for_attribute(:code) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:code=\"1\"/>"
    end

    with_value(-10) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:code=\"-10\"/>"
    end

    with_value(122.2) do
      it_should_raise_an_exception
    end

    with_value(:cool) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:height) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:h=\"1\"/>"
    end

    with_value(-10) do
      it_should_raise_an_exception
    end

    with_value(122.2) do
      it_should_raise_an_exception
    end

    with_value(:cool) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:orientation) do
    with_value(:portrait) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:orient=\"portrait\"/>"
    end

    with_value(:landscape) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:orient=\"landscape\"/>"
    end

    with_value(:somethingWeird) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:pgSz w:w=\"1\"/>"
    end

    with_value(-10) do
      it_should_raise_an_exception
    end

    with_value(122.2) do
      it_should_raise_an_exception
    end

    with_value(:cool) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(width: 12240, height: 5000, orientation: :landscape) do
    it_should_output "<w:pgSz w:h=\"5000\" w:orient=\"landscape\" w:w=\"12240\"/>", assign: false
  end

end
