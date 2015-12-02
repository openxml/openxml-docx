require "spec_helper"

describe OpenXml::DrawingML::Elements::SRGBColor do
  include ElementTestMacros

  it_should_use tag: :srgbClr, name: "srgb_color"

  for_attribute(:value) do
    with_value("FFFFFF") do
      it_should_assign_successfully
      it_should_output "<a:srgbClr val=\"FFFFFF\"/>"
    end

    with_value("blue") do
      it_should_raise_an_exception
    end

    with_value(:blue) do
      it_should_raise_an_exception
    end

    with_value(23) do
      it_should_raise_an_exception
    end
  end

end
