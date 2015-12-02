require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingObjectNvProperties do
  include ElementTestMacros

  it_should_use tag: :docPr, name: "word_processing_drawing_object_nv_properties"

  with_no_attributes_set do
    it_should_output "<wp:docPr/>", assign: false
  end

  for_attribute(:description) do
    with_value("valid value")do
      it_should_assign_successfully
      it_should_output "<wp:docPr descr=\"valid value\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hidden) do
    with_value(true)do
      it_should_assign_successfully
      it_should_output "<wp:docPr hidden=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value(1)do
      it_should_assign_successfully
      it_should_output "<wp:docPr id=\"1\"/>"
    end

    with_value("invalid") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:property_name) do
    with_value("valid")do
      it_should_assign_successfully
      it_should_output "<wp:docPr name=\"valid\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:title) do
    with_value("valid")do
      it_should_assign_successfully
      it_should_output "<wp:docPr title=\"valid\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

end
