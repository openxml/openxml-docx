require "spec_helper"

describe OpenXml::Docx::Elements::Background do
  include ElementTestMacros

  it_should_use tag: :background, name: "background"

  for_attribute(:color) do
    with_value("FF00AA") do
      it_should_assign_successfully
      it_should_output "<w:background w:color=\"FF00AA\"/>"
    end

    with_values([:blue, "1ff0aa"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_color) do
    with_value(:accent1) do
      it_should_assign_successfully
      it_should_output "<w:background w:themeColor=\"accent1\"/>"
    end

    with_value(:not_allowed) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_shade) do
    with_value("0F") do
      it_should_assign_successfully
      it_should_output "<w:background w:themeShade=\"0F\"/>"
    end

    with_values([:red, "00FF", "0f"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_tint) do
    with_value("0F") do
      it_should_assign_successfully
      it_should_output "<w:background w:themeTint=\"0F\"/>"
    end

    with_values([:red, "00FF", "0f"]) do
      it_should_raise_an_exception
    end
  end

end
