require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapPolygon do
  include ElementTestMacros

  it_should_use tag: :wrapPolygon, name: "word_processing_drawing_wrap_polygon"

  for_attribute(:edited) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:wrapPolygon edited=\"true\"/>"
    end

    with_value(:no_good) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<wp:wrapPolygon/>", assign: false
  end

end
