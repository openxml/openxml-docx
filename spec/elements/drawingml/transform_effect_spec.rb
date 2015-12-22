require "spec_helper"

describe OpenXml::DrawingML::Elements::TransformEffect do
  include ElementTestMacros

  it_should_use tag: :xfrm, name: "transform_effect"

  for_attribute(:horizontal_skew) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm kx=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm kx=\"-1\"/>"
    end

    with_value([:not_a_number, 12.34]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_skew) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm ky=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm ky=\"-1\"/>"
    end

    with_value([:not_a_number, 12.34]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_shift) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm tx=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm tx=\"-1\"/>"
    end

    with_value([:not_a_number, 12.34]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_shift) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm ty=\"1\"/>"
    end

    with_value(-1) do
      it_should_assign_successfully
      it_should_output "<a:xfrm ty=\"-1\"/>"
    end

    with_value([:not_a_number, 12.34]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_ratio) do
    %w(1% -1% 1.1%).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:xfrm sx=\"#{allowed_value}\"/>"
      end
    end

    with_values(["1", 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_ratio) do
    %w(1% -1% 1.1%).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:xfrm sy=\"#{allowed_value}\"/>"
      end
    end

    with_values(["1", 1]) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:xfrm/>", assign: false
  end

end
