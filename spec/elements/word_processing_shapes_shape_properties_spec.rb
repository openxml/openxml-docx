require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesShapeProperties do
  include ElementTestMacros

  it_should_use tag: :spPr, name: "word_processing_shapes_shape_properties"

  for_attribute(:bwMode) do
    allowed = %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
