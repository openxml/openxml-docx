require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapTopAndBottom do
  include ElementTestMacros

  it_should_use tag: :wrapTopAndBottom, name: "word_processing_drawing_wrap_top_and_bottom"

  for_attribute(:distance_from_bottom) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapTopAndBottom distB=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_top) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapTopAndBottom distT=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

end
