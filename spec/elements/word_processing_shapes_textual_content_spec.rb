require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesTextualContent do
  include ElementTestMacros

  it_should_use tag: :txbx, name: "word_processing_shapes_textual_content"

  with_no_attributes_set do
    it_should_output "<wps:txbx/>", assign: false
  end

  for_attribute(:id) do
    with_value(1)do
      it_should_assign_successfully
      it_should_output "<wps:txbx id=\"1\"/>"
    end

    with_value("invalid") do
      it_should_raise_an_exception
    end
  end

end
