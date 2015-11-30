require "spec_helper"

describe OpenXml::Docx::Properties::ManualWidth do
  include PropertyTestMacros

  it_should_use tag: :fitText, name: "manual_width"

  for_attribute(:id) do
    with_value(12) do
      it_should_assign_successfully
      it_should_output "<w:fitText w:id=\"12\"/>"
    end

    with_value(-134) do
      it_should_assign_successfully
      it_should_output "<w:fitText w:id=\"-134\"/>"
    end

    with_value(12.3) do
      it_should_raise_an_exception
    end

    with_value(:three) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    with_value(12) do
      it_should_assign_successfully
      it_should_output "<w:fitText w:val=\"12\"/>"
    end

    with_value(-134) do
      it_should_raise_an_exception
    end

    with_value(12.3) do
      it_should_raise_an_exception
    end

    with_value(:three) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(id: 50, width: 720) do
    it_should_output "<w:fitText w:id=\"50\" w:val=\"720\"/>", assign: false
  end

end
