require "spec_helper"

describe OpenXml::DrawingML::Elements::Outline do
  include ElementTestMacros

  it_should_use tag: :ln, name: "outline"

  for_attribute(:alignment, displays_as: :algn) do
    allowed = %i(ctr in)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:cap) do
    allowed = %i(flat rnd sq)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:compound_type, displays_as: :cmpd) do
    allowed = %i(dbl sng thickThin thinThick tri)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_ok) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width, displays_as: :w) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([1.1, -1]) do
      it_should_raise_an_exception
    end
  end




end
