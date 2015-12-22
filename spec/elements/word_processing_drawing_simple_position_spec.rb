require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingSimplePosition do
  include ElementTestMacros

  it_should_use tag: :simplePos, name: "word_processing_drawing_simple_position"

  with_no_attributes_set do
    it_should_output "<wp:simplePos/>", assign: false
  end

  for_attribute(:x) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:simplePos x=\"1234\"/>"
    end

    with_value(-1234)do
      it_should_assign_successfully
      it_should_output "<wp:simplePos x=\"-1234\"/>"
    end

    with_values([12.34, "not a number"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:y) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:simplePos y=\"1234\"/>"
    end

    with_value(-1234)do
      it_should_assign_successfully
      it_should_output "<wp:simplePos y=\"-1234\"/>"
    end

    with_values([12.34, "not a number"]) do
      it_should_raise_an_exception
    end
  end

end
