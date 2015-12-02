require "spec_helper"

describe OpenXml::DrawingML::Elements::TransformEffect do
  include ElementTestMacros

  it_should_use tag: :xfrm, name: "transform_effect"

  integer_attributes = { horizontal_skew: :kx,
                         vertical_skew: :ky,
                         horizontal_shift: :tx,
                         vertical_shift: :ty }

  percent_attributes = { horizontal_ratio: :sx,
                         vertical_ratio: :sy }

  integer_attributes.keys.each do |attr_name|
    for_attribute(attr_name) do
      with_value(1) do
        it_should_assign_successfully
        display = integer_attributes[attr_name]
        it_should_output "<a:xfrm #{display}=\"1\"/>"
      end

      with_value(-1) do
        it_should_assign_successfully
        display = integer_attributes[attr_name]
        it_should_output "<a:xfrm #{display}=\"-1\"/>"
      end

      with_value(:not_a_number) do
        it_should_raise_an_exception
      end
    end
  end

  percent_attributes.keys.each do |attr_name|
    for_attribute(attr_name) do
      with_value("1%") do
        it_should_assign_successfully
        display = percent_attributes[attr_name]
        it_should_output "<a:xfrm #{display}=\"1%\"/>"
      end

      with_value("-1%") do
        it_should_assign_successfully
        display = percent_attributes[attr_name]
        it_should_output "<a:xfrm #{display}=\"-1%\"/>"
      end

      with_value("1.1%") do # Decimals are allowed
        it_should_assign_successfully
        display = percent_attributes[attr_name]
        it_should_output "<a:xfrm #{display}=\"1.1%\"/>"
      end

      with_value("1") do # No percent sign
        it_should_raise_an_exception
      end

      with_value(1) do # Not a string
        it_should_raise_an_exception
      end
    end
  end

  with_no_attributes_set do
    it_should_output "<a:xfrm/>", assign: false
  end

end
