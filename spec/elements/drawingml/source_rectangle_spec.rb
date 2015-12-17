require "spec_helper"

describe OpenXml::DrawingML::Elements::SourceRectangle do
  include ElementTestMacros

  it_should_use tag: :srcRect, name: "source_rectangle"

  for_attribute(:bottom_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect b=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect b=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect l=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect l=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect r=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect r=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_offset) do
    with_value("10%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect t=\"10%\"/>"
    end

    with_value("10.1%") do
      it_should_assign_successfully
      it_should_output "<a:srcRect t=\"10.1%\"/>"
    end

    with_values(["10", 10, "%"]) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:srcRect/>", assign: false
  end

end
