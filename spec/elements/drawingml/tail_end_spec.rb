require "spec_helper"

describe OpenXml::DrawingML::Elements::TailEnd do
  include ElementTestMacros

  it_should_use tag: :tailEnd, name: "tail_end"

  attributes = {
    length: { display: :len, ok_values: %i(lg med sm) },
    type: { display: :type, ok_values: %i(arrow diamond none oval stealth triangle) },
    width: { display: :w, ok_values: %i(lg med sm) }
  }

  attributes.keys.each do |attr_name|
    for_attribute(attr_name) do
      attributes[attr_name][:ok_values].each do |ok_value|
        with_value(ok_value) do
          it_should_assign_successfully
          it_should_output "<a:tailEnd #{attributes[attr_name][:display]}=\"#{ok_value}\"/>"
        end
      end

      with_value(:bad_value) do
        it_should_raise_an_exception
      end
    end
  end

end
