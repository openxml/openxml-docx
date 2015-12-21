require "spec_helper"

describe OpenXml::DrawingML::Elements::PictureShapeProperties do
  include ElementTestMacros

  it_should_use tag: :spPr, name: "picture_shape_properties"

  for_attribute(:black_and_white_mode) do
    %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<pic:spPr bwMode=\"#{good_value}\"/>"
      end
    end

    with_value(:disallowed_value) do
      it_should_raise_an_exception
    end
  end

end
