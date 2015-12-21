require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingAnchor do
  include ElementTestMacros

  it_should_use tag: :anchor, name: "word_processing_drawing_anchor"

  with_no_attributes_set do
    it_should_output "<wp:anchor/>", assign: false
  end

  for_attribute(:allow_overlap) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:anchor allowOverlap=\"true\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:behind_document) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:anchor behindDoc=\"true\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hidden) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:anchor hidden=\"true\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:layout_in_cell) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:anchor layoutInCell=\"true\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:locked) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wp:anchor locked=\"true\"/>"
    end

    with_value("") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_bottom) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:anchor distB=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_left) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:anchor distL=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_right) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:anchor distR=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:distance_from_top) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:anchor distT=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:z_index) do
    with_value(1234)do
      it_should_assign_successfully
      it_should_output "<wp:anchor relativeHeight=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

end
