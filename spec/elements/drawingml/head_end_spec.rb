require "spec_helper"

describe OpenXml::DrawingML::Elements::HeadEnd do
  include ElementTestMacros

  it_should_use tag: :headEnd, name: "head_end"

  for_attribute(:length, displays_as: :len) do
    allowed = %i(lg med sm)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    allowed = %i(arrow diamond none oval stealth triangle)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width, displays_as: :w) do
    allowed = %i(lg med sm)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end


end
