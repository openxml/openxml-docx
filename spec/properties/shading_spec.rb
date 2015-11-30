require "spec_helper"

describe OpenXml::Docx::Properties::Shading do
  include PropertyTestMacros

  it_should_use tag: :shd, name: "shading"

  for_attribute(:color) do
    with_value("4F81BD") do
      it_should_assign_successfully
      it_should_output "<w:shd w:color=\"4F81BD\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:shd w:color=\"auto\"/>"
    end

    with_value("green") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:fill) do
    with_value("4F81BD") do
      it_should_assign_successfully
      it_should_output "<w:shd w:fill=\"4F81BD\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:shd w:fill=\"auto\"/>"
    end

    with_value("green") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_color) do
    with_value(:hyperlink) do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeColor=\"hyperlink\"/>"
    end

    with_value(:lens_flare) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_fill) do
    with_value(:hyperlink) do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeFill=\"hyperlink\"/>"
    end

    with_value(:lens_flare) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_fill_shade) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeFillShade=\"BF\"/>"
    end

    with_value(:dark) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_fill_tint) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeFillTint=\"BF\"/>"
    end

    with_value(:pink) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_shade) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeShade=\"BF\"/>"
    end

    with_value(:dark) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:theme_tint) do
    with_value("BF") do
      it_should_assign_successfully
      it_should_output "<w:shd w:themeTint=\"BF\"/>"
    end

    with_value(:pink) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:pattern) do
    with_value(:pct90) do
      it_should_assign_successfully
      it_should_output "<w:shd w:val=\"pct90\"/>"
    end

    with_value(:solid) do
      it_should_assign_successfully
      it_should_output "<w:shd w:val=\"solid\"/>"
    end

    with_value(:vertStripe) do
      it_should_assign_successfully
      it_should_output "<w:shd w:val=\"vertStripe\"/>"
    end

    with_value(:somethingIJustMadeUp) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(pattern: :pct20, theme_color: :accent6, theme_fill: :accent3) do
    it_should_output "<w:shd w:themeColor=\"accent6\" w:themeFill=\"accent3\" w:val=\"pct20\"/>", assign: false
  end

end
