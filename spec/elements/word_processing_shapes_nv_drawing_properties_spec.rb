require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesNvDrawingProperties do
  include ElementTestMacros

  it_should_use tag: :cNvPr, name: "word_processing_shapes_nv_drawing_properties"

  for_attribute(:description) do
    with_value("String") do
      it_should_assign_successfully
      it_should_output "<wps:cNvPr descr=\"String\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hidden) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:cNvPr hidden=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<wps:cNvPr id=\"1\"/>"
    end

    with_values([:not_a_number, -1, 1.1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:object_name) do
    with_value("String") do
      it_should_assign_successfully
      it_should_output "<wps:cNvPr name=\"String\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:title) do
    with_value("String") do
      it_should_assign_successfully
      it_should_output "<wps:cNvPr title=\"String\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end


end
