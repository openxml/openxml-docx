require "spec_helper"

describe OpenXml::DrawingML::Elements::NonVisualShapeDrawingProperties do
  include ElementTestMacros

  it_should_use tag: :cNvSpPr, name: "non_visual_shape_drawing_properties"

  for_attribute(:textbox) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:cNvSpPr txBox=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<wps:cNvSpPr txBox=\"false\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

end
