require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingPositionV do
  include ElementTestMacros

  it_should_use tag: :positionV, name: "word_processing_drawing_position_v"

  for_attribute(:relative_from) do
    %i(bottomMargin insideMargin line margin outsideMargin page paragraph topMargin).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<wp:positionV relativeFrom=\"#{good_value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
