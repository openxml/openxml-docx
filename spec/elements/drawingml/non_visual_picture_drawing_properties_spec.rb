require "spec_helper"

describe OpenXml::DrawingML::Elements::NonVisualPictureDrawingProperties do
  include ElementTestMacros

  it_should_use tag: :cNvPicPr, name: "non_visual_picture_drawing_properties"

  for_attribute(:preferRelativeResize) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<pic:cNvPicPr preferRelativeResize=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<pic:cNvPicPr preferRelativeResize=\"false\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
end
