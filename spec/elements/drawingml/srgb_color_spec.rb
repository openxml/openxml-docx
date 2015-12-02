require "spec_helper"

describe OpenXml::DrawingML::Elements::SRGBColor do
  include ElementTestMacros

  it_should_use tag: :srgbClr, name: "srgb_color"

  for_attribute(:value, displays_as: :val) do
    with_value("FFFFFF") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    not_allowed = ["blue", :blue, 23]
    with_values(not_allowed) do
      it_should_raise_an_exception
    end
  end

end
