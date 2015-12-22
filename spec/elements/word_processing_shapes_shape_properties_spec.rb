require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesShapeProperties do
  include ElementTestMacros

  it_should_use tag: :spPr, name: "word_processing_shapes_shape_properties"

  for_attribute(:bw_mode) do
    %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<wps:spPr bwMode=\"#{allowed_value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end


end
