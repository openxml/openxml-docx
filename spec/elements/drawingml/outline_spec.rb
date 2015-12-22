require "spec_helper"

describe OpenXml::DrawingML::Elements::Outline do
  include ElementTestMacros

  it_should_use tag: :ln, name: "outline"

  for_attribute(:alignment) do
    with_value(:ctr) do
      it_should_assign_successfully
      it_should_output "<a:ln algn=\"ctr\"/>"
    end

    with_value(:in) do
      it_should_assign_successfully
      it_should_output "<a:ln algn=\"in\"/>"
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:cap) do
    %i(flat rnd sq).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:ln cap=\"#{allowed_value}\"/>"
      end
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:compound_type) do
    %i(dbl sng thickThin thinThick tri).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:ln cmpd=\"#{allowed_value}\"/>"
      end
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width, displays_as: :w) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:ln w=\"1\"/>"
    end

    with_values([1.1, -1]) do
      it_should_raise_an_exception
    end
  end




end
