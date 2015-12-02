require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingPositionV do
  include ElementTestMacros

  it_should_use tag: :positionV, name: "word_processing_drawing_position_v"

  ok_values = %i(bottomMargin insideMargin line margin outsideMargin page paragraph topMargin)

  for_attribute(:relativeFrom) do
    ok_values.each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wp:positionV relativeFrom=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
