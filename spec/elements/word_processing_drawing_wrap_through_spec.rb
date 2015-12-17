require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapThrough do
  include ElementTestMacros

  it_should_use tag: :wrapThrough, name: "word_processing_drawing_wrap_through"

  for_attribute(:distance_from_left) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapThrough distL=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_right) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapThrough distR=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap_text) do
    %i(bothSides largest left right).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<wp:wrapThrough wrapText=\"#{good_value}\"/>"
      end

      with_value(:bad_value) do
        it_should_raise_an_exception
      end
    end
  end

end
