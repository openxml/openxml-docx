require "spec_helper"

describe OpenXml::DrawingML::Elements::TransformEffect do
  include ElementTestMacros

  it_should_use tag: :xfrm, name: "transform_effect"

  for_attribute(:horizontal_skew, displays_as: :kx) do
    with_values([1, -1]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_number) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_skew, displays_as: :ky) do
    with_values([1, -1]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_number) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_shift, displays_as: :tx) do
    with_values([1, -1]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_number) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_shift, displays_as: :ty) do
    with_values([1, -1]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_number) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_ratio, displays_as: :sx) do
    allowed = %w(1% -1% 1.1%)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(["1", 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_ratio, displays_as: :sy) do
    allowed = %w(1% -1% 1.1%)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values(["1", 1]) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:xfrm/>", assign: false
  end

end
