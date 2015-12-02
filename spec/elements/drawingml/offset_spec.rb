require "spec_helper"

describe OpenXml::DrawingML::Elements::Offset do
  include ElementTestMacros

  it_should_use tag: :off, name: "offset"

  attributes = %i(x y)

  attributes.each do |attribute|
    for_attribute(attribute) do
      with_value(1) do
        it_should_assign_successfully
        it_should_output "<a:off #{attribute}=\"1\"/>"
      end

      with_value(-1) do
        it_should_assign_successfully
        it_should_output "<a:off #{attribute}=\"-1\"/>"
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
