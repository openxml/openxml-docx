require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingPositionH do
  include ElementTestMacros

  it_should_use tag: :positionH, name: "word_processing_drawing_position_h"

  for_attribute(:relativeFrom) do
    allowed = %i(character column insideMargin leftMargin margin outsideMargin page rightMargin)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
