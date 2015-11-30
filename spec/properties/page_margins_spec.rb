require "spec_helper"

describe OpenXml::Docx::Properties::PageMargins do
  include PropertyTestMacros

  it_should_use tag: :pgMar, name: "page_margins"

  for_attribute(:bottom) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:bottom=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:bottom=\"-1440\"/>"
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:footer) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:footer=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_raise_an_exception
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:gutter) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:gutter=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_raise_an_exception
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:header) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:header=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_raise_an_exception
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:left=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_raise_an_exception
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:right=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_raise_an_exception
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top) do
    with_value(1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:top=\"1440\"/>"
    end

    with_value(-1440) do
      it_should_assign_successfully
      it_should_output "<w:pgMar w:top=\"-1440\"/>"
    end

    with_value(9832.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(header: 720, bottom: 1440, top: 1440, right: 1440, left: 1440, footer: 720, gutter: 0) do
    it_should_output "<w:pgMar w:bottom=\"1440\" w:footer=\"720\" w:gutter=\"0\" w:header=\"720\" w:left=\"1440\" w:right=\"1440\" w:top=\"1440\"/>", assign: false
  end
end
