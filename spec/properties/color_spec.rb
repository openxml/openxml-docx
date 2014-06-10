require "spec_helper"

describe Rocx::Properties::Color do
  include PropertyTestMacros

  it_should_use tag: :color, name: "color"

  for_attribute(:theme_color) do
    with_value(:hyperlink) do
      it_should_assign_successfully
      it_should_output "<w:color w:themeColor=\"hyperlink\"/>"
    end
  end

  for_attribute(:theme_shade) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:color w:themeShade=\"BF\"/>"
    end

    with_value(:dark) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_tint) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:color w:themeTint=\"BF\"/>"
    end

    with_value(:pink) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:color) do
    with_value(:D99694) do
      it_should_assign_successfully
      it_should_output "<w:color w:val=\"D99694\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:color w:val=\"auto\"/>"
    end
  end

end
