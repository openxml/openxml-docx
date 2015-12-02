require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesShape do
  include ElementTestMacros

  it_should_use tag: :wsp, name: "word_processing_shapes_shape"

  with_no_attributes_set do
    it_should_output "<wps:wsp/>", assign: false
  end

  for_attribute(:normalEastAsianFlow) do
    with_value(true)do
      it_should_assign_successfully
      it_should_output "<wps:wsp normalEastAsianFlow=\"true\"/>"
    end

    with_value("invalid") do
      it_should_raise_an_exception
    end
  end

end
