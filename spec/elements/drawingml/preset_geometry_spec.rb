require "spec_helper"

describe OpenXml::DrawingML::Elements::PresetGeometry do
  include ElementTestMacros

  it_should_use tag: :prstGeom, name: "preset_geometry"

  for_attribute(:preset, displays_as: :prst) do
    with_value(:roundRect) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:invalidGeometry) do
      it_should_raise_an_exception
    end
  end

end
