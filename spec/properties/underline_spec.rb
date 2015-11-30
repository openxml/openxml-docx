require "spec_helper"

describe OpenXml::Docx::Properties::Underline do
  include PropertyTestMacros

  it_should_use tag: :u, name: "underline"

  for_attribute(:color) do
    with_value("FF34E1") do
      it_should_assign_successfully
      it_should_output "<w:u w:color=\"FF34E1\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:u w:color=\"auto\"/>"
    end

    with_value(:nope) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_color) do
    with_value(:accent3) do
      it_should_assign_successfully
      it_should_output "<w:u w:themeColor=\"accent3\"/>"
    end

    with_value(:nope) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_shade) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:u w:themeShade=\"BF\"/>"
    end

    with_value(:nope) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_tint) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:u w:themeTint=\"BF\"/>"
    end

    with_value(:nope) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    with_value(:dash) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dash\"/>"
    end

    with_value(:dashDotDotHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dashDotDotHeavy\"/>"
    end

    with_value(:dashDotHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dashDotHeavy\"/>"
    end

    with_value(:dashedHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dashedHeavy\"/>"
    end

    with_value(:dashLong) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dashLong\"/>"
    end

    with_value(:dashLongHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dashLongHeavy\"/>"
    end

    with_value(:dotDash) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dotDash\"/>"
    end

    with_value(:dotDotDash) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dotDotDash\"/>"
    end

    with_value(:dotted) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dotted\"/>"
    end

    with_value(:dottedHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"dottedHeavy\"/>"
    end

    with_value(:double) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"double\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"none\"/>"
    end

    with_value(:single) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"single\"/>"
    end

    with_value(:thick) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"thick\"/>"
    end

    with_value(:wave) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"wave\"/>"
    end

    with_value(:wavyDouble) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"wavyDouble\"/>"
    end

    with_value(:wavyHeavy) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"wavyHeavy\"/>"
    end

    with_value(:words) do
      it_should_assign_successfully
      it_should_output "<w:u w:val=\"words\"/>"
    end

    with_value(:triple) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(color: "95B3D7", theme_color: :accent2, theme_tint: "99") do
    it_should_output "<w:u w:color=\"95B3D7\" w:themeColor=\"accent2\" w:themeTint=\"99\"/>", assign: false
  end

end
