require "spec_helper"

describe OpenXml::DrawingML::Elements::TailEnd do
  include ElementTestMacros

  it_should_use tag: :tailEnd, name: "tail_end"

  for_attribute(:length) do
    %i(lg med sm).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:tailEnd len=\"#{allowed_value}\"/>"
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
        it_should_output "<a:tailEnd type=\"#{allowed_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    %i(lg med sm).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<a:tailEnd w=\"#{allowed_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

end
