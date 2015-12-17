require "spec_helper"

describe OpenXml::DrawingML::Elements::NonVisualDrawingProperties do
  include ElementTestMacros

  it_should_use tag: :cNvPr, name: "non_visual_drawing_properties"

  for_attribute(:description, displays_as: :descr) do
    with_value("string") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hidden) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<pic:cNvPr hidden=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<pic:cNvPr hidden=\"false\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value(123) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_values([-123, :not_a_number]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:picture_name, displays_as: :name) do
    with_value("string") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:title) do
    with_value("string") do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

end
