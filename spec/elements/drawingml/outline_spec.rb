require "spec_helper"

describe OpenXml::DrawingML::Elements::Outline do
  include ElementTestMacros

  it_should_use tag: :ln, name: "outline"

  attributes = {
    alignment: { display: :algn, ok_values: %i(ctr in) },
    cap: { display: :cap, ok_values: %i(flat rnd sq) },
    compound_type: { display: :cmpd, ok_values: %i(dbl sng thickThin thinThick tri) }
  }

  attributes.keys.each do |attr_name|
    for_attribute(attr_name) do
      attributes[attr_name][:ok_values].each do |ok_value|
        with_value(ok_value) do
          it_should_assign_successfully
          it_should_output "<a:ln #{attributes[attr_name][:display]}=\"#{ok_value}\"/>"
        end
      end

      with_value(:not_ok) do
        it_should_raise_an_exception
      end
    end
  end

  for_attribute(:width) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:ln w=\"1\"/>"
    end

    with_value(1.1) do
      it_should_raise_an_exception
    end

    with_value(-1) do
      it_should_raise_an_exception
    end
  end

end
