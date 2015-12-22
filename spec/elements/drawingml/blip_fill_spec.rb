require "spec_helper"

describe OpenXml::DrawingML::Elements::BlipFill do
  include ElementTestMacros

  it_should_use tag: :blipFill, name: "blip_fill"

  for_attribute(:dpi) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<pic:blipFill dpi=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<pic:blipFill dpi=\"-1\"/>"
    end

    with_values([:not_a_number, 12.34]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:rotate_with_shape) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<pic:blipFill rotWithShape=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<pic:blipFill rotWithShape=\"false\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<pic:blipFill/>", assign: false
  end

end
