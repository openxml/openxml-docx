require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingSimplePosition do
  include ElementTestMacros

  it_should_use tag: :simplePos, name: "word_processing_drawing_simple_position"

  with_no_attributes_set do
    it_should_output "<wp:simplePos/>", assign: false
  end


  %i(x y).each do |attr|
    for_attribute(attr) do
      with_value(1234)do
        it_should_assign_successfully
        it_should_output "<wp:simplePos #{attr}=\"1234\"/>"
      end

      with_value(-1234) do
        it_should_assign_successfully
        it_should_output "<wp:simplePos #{attr}=\"-1234\"/>"
      end

      with_value("hey") do
        it_should_raise_an_exception
      end
    end
  end

end
