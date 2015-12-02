require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingPositionH do
  include ElementTestMacros

  it_should_use tag: :positionH, name: "word_processing_drawing_position_h"

  ok_values = %i(character column insideMargin leftMargin margin outsideMargin page rightMargin)

  for_attribute(:relativeFrom) do
    ok_values.each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wp:positionH relativeFrom=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
