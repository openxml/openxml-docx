require "spec_helper"

describe OpenXml::DrawingML::Elements::NonVisualPictureDrawingProperties do
  include ElementTestMacros

  it_should_use tag: :cNvPicPr, name: "non_visual_picture_drawing_properties"

  for_attribute(:preferRelativeResize) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
end
