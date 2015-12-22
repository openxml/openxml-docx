require "spec_helper"

describe OpenXml::DrawingML::Elements::HeadEnd do
  include ElementTestMacros

  it_should_use tag: :headEnd, name: "head_end"

  for_attribute(:length) do
    %i(lg med sm).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:headEnd len=\"#{allowed_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    %i(arrow diamond none oval stealth triangle).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:headEnd type=\"#{allowed_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width, displays_as: :w) do
    %i(lg med sm).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:headEnd w=\"#{allowed_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end


end
