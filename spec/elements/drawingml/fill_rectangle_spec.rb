require "spec_helper"

describe OpenXml::DrawingML::Elements::FillRectangle do
  include ElementTestMacros

  it_should_use tag: :fillRect, name: "fill_rectangle"

  for_attribute(:bottom_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect b=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect b=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect l=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect l=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect r=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect r=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect t=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:fillRect t=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:fillRect/>", assign: false
  end

end
