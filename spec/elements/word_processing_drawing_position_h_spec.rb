require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingPositionH do
  include ElementTestMacros

  it_should_use tag: :positionH, name: "word_processing_drawing_position_h"

  for_attribute(:relative_from) do
    %i(character column insideMargin leftMargin margin outsideMargin page rightMargin).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<wp:positionH relativeFrom=\"#{good_value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
