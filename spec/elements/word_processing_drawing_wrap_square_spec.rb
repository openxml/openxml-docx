require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapSquare do
  include ElementTestMacros

  it_should_use tag: :wrapSquare, name: "word_processing_drawing_wrap_square"

  for_attribute(:distance_from_bottom) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapSquare distB=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_left) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapSquare distL=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_right) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapSquare distR=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_top) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wp:wrapSquare distT=\"1\"/>"
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap_text) do
    %i(bothSides largest left right).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<wp:wrapSquare wrapText=\"#{good_value}\"/>"
      end

      with_value(:bad_value) do
        it_should_raise_an_exception
      end
    end
  end

end
