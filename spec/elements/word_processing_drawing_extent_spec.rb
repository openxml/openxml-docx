require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingExtent do
  include ElementTestMacros

  it_should_use tag: :extent, name: "word_processing_drawing_extent"

  with_no_attributes_set do
    it_should_output "<wp:extent/>", assign: false
  end

  for_attribute(:extent_length, displays_as: :cx) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:extent_width, displays_as: :cy) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

end
