require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapCoordinate do
  include ElementTestMacros

  %i(start lineTo).each do |good_tag|
    for_attribute(:x) do
      with_value(1) do
        it_should_assign_successfully good_tag
        it_should_output "<wp:#{good_tag} x=\"1\"/>", good_tag
      end

      with_value(-1) do
        it_should_assign_successfully good_tag
        it_should_output "<wp:#{good_tag} x=\"-1\"/>", good_tag
      end

      with_value(20.5) do
        it_should_raise_an_exception
      end
    end

    for_attribute(:y) do
      with_value(1) do
        it_should_assign_successfully good_tag
        it_should_output "<wp:#{good_tag} y=\"1\"/>", good_tag
      end

      with_value(-1) do
        it_should_assign_successfully good_tag
        it_should_output "<wp:#{good_tag} y=\"-1\"/>", good_tag
      end

      with_value(20.5) do
        it_should_raise_an_exception
      end
    end
  end

end
