require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingEffectExtent do
  include ElementTestMacros

  it_should_use tag: :effectExtent, name: "word_processing_drawing_effect_extent"

  with_no_attributes_set do
    it_should_output "<wp:effectExtent/>", assign: false
  end


  for_attribute(:bottom_edge, displays_as: :b) do
    with_values([1234, -1234])do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_edge, displays_as: :l) do
    with_values([1234, -1234])do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_edge, displays_as: :r) do
    with_value([1234, -1234])do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_edge, displays_as: :t) do
    with_value([1234, -1234])do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("wrong") do
      it_should_raise_an_exception
    end
  end

end
