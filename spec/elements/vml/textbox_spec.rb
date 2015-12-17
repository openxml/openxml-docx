require "spec_helper"

describe OpenXml::Vml::Elements::TextBox do
  include ElementTestMacros

  it_should_use tag: :textbox, name: "text_box"

  for_attribute(:id) do
    with_value("This is a string") do
      it_should_assign_successfully
      it_should_output "<v:textbox id=\"This is a string\"/>"
    end

    with_values([:not_a_string, 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:inset) do
    with_value("This is a string") do
      it_should_assign_successfully
      it_should_output "<v:textbox inset=\"This is a string\"/>"
    end

    with_values([:not_a_string, 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:insetmode) do
    %i(auto custom).each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<v:textbox insetmode=\"#{value}\"/>"
      end
    end

    with_values([:incorrect, "hello", 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:singleclick) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<v:textbox singleclick=\"true\"/>"
    end

    with_values([:not_a_boolean, 1]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:style) do
    with_value("This is a string") do
      it_should_assign_successfully
      it_should_output "<v:textbox style=\"This is a string\"/>"
    end

    with_values([:not_a_string, 1]) do
      it_should_raise_an_exception
    end
  end

end
