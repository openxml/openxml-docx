require "spec_helper"

describe OpenXml::Docx::Elements::FontPitch do
  include ElementTestMacros

  it_should_use tag: :pitch, name: "font_pitch"

  for_attribute(:value) do
    %i(default fixed variable).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<w:pitch w:val=\"#{good_value}\"/>"
      end
    end

    with_value(:bad_value) do
      it_should_raise_an_exception
    end
  end

end
