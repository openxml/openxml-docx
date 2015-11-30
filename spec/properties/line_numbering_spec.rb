require "spec_helper"

describe OpenXml::Docx::Properties::LineNumbering do
  include PropertyTestMacros

  it_should_use tag: :lnNumType, name: "line_numbering"

  for_attribute(:count_by) do
    with_value(5) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:countBy=\"5\"/>"
    end

    with_value(-5) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:countBy=\"-5\"/>"
    end

    with_value(123.4) do
      it_should_raise_an_exception
    end

    with_value(:twelve) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance) do
    with_value(720) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:distance=\"720\"/>"
    end

    with_value(-720) do
      it_should_raise_an_exception
    end

    with_value(123.4) do
      it_should_raise_an_exception
    end

    with_value(:twelve) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:restart) do
    with_value(:continuous) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:restart=\"continuous\"/>"
    end

    with_value(:newPage) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:restart=\"newPage\"/>"
    end

    with_value(:newSection) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:restart=\"newSection\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:start) do
    with_value(5) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:start=\"5\"/>"
    end

    with_value(-5) do
      it_should_assign_successfully
      it_should_output "<w:lnNumType w:start=\"-5\"/>"
    end

    with_value(123.4) do
      it_should_raise_an_exception
    end

    with_value(:twelve) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(start: 3, count_by: 5) do
    it_should_output "<w:lnNumType w:countBy=\"5\" w:start=\"3\"/>", assign: false
  end

end
