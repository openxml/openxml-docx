require "spec_helper"

describe OpenXml::DrawingML::Elements::Extents do
  include ElementTestMacros

  it_should_use tag: :ext, name: "extents"

  attributes = { extent_length: :cx, extent_width: :cy }

  attributes.keys.each do |attr_name|
    for_attribute(attr_name) do
      with_value(1) do
        it_should_assign_successfully
        display = attributes[attr_name]
        it_should_output "<a:ext #{display}=\"1\"/>"
      end

      with_value(-1) do
        it_should_raise_an_exception
      end

      with_value(1.1) do
        it_should_raise_an_exception
      end

      with_value(:not_a_number) do
        it_should_raise_an_exception
      end
    end
  end

end
