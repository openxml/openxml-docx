require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingAnchor do
  include ElementTestMacros

  it_should_use tag: :anchor, name: "word_processing_drawing_anchor"

  with_no_attributes_set do
    it_should_output "<wp:anchor/>", assign: false
  end

  true_false_attributes = %i(allowOverlap behindDoc hidden layoutInCell locked)
  true_false_attributes.each do |attr|
    for_attribute(attr) do
      with_value(true) do
        it_should_assign_successfully
        it_should_output_regular_xml
      end

      with_value("") do
        it_should_raise_an_exception
      end
    end
  end

  positive_integer_attributes = %i(distB distL distR distT relativeHeight)
  positive_integer_attributes.each do |attr|
    for_attribute(attr) do
      with_value(1234)do
        it_should_assign_successfully
        it_should_output_regular_xml
      end

      with_value(-1234) do
        it_should_raise_an_exception
      end
    end
  end

end
