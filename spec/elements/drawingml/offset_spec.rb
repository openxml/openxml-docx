require "spec_helper"

describe OpenXml::DrawingML::Elements::Offset do
  include ElementTestMacros

  it_should_use tag: :off, name: "offset"

  attributes = %i(x y)

  for_attribute(:x) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:off x=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:off x=\"-1\"/>"
    end

    with_values([1.1, :not_a_number]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:y) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:off y=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:off y=\"-1\"/>"
    end

    with_values([1.1, :not_a_number]) do
      it_should_raise_an_exception
    end
  end

end
