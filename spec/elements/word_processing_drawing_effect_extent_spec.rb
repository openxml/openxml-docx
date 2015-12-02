require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingEffectExtent do
  include ElementTestMacros

  it_should_use tag: :effectExtent, name: "word_processing_drawing_effect_extent"

  with_no_attributes_set do
    it_should_output "<wp:effectExtent/>", assign: false
  end


  for_attribute(:bottom_edge) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent b=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent b=\"-1234\"/>"
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_edge) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent l=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent l=\"-1234\"/>"
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_edge) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent r=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent r=\"-1234\"/>"
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_edge) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent t=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_assign_successfully
      it_should_output "<wp:effectExtent t=\"-1234\"/>"
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

end
