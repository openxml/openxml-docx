require "spec_helper"

describe OpenXml::Docx::Properties::LatentStylesException do
  include PropertyTestMacros

  it_should_use tag: :lsdException, name: "latent_styles_exception", value: "StyleName"

  for_attribute(:locked) do
    with_value(true) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:locked=\"true\" w:name=\"StyleName\"/>", "StyleName"
    end

    with_value(1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:style_name) do
    with_value("NewStyleName") do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"NewStyleName\"/>", "StyleName"
    end

    with_value(nil) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:qFormat) do
    with_value(true) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"StyleName\" w:qFormat=\"true\"/>", "StyleName"
    end

    with_value(1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:semi_hidden) do
    with_value(true) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"StyleName\" w:semiHidden=\"true\"/>", "StyleName"
    end

    with_value(1) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:ui_priority) do
    with_value(1) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"StyleName\" w:uiPriority=\"1\"/>", "StyleName"
    end

    with_value(-1) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"StyleName\" w:uiPriority=\"-1\"/>", "StyleName"
    end

    with_value(1.3) do
      it_should_raise_an_exception
    end

    with_value(:a_lot) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:unhide_when_used) do
    with_value(true) do
      it_should_assign_successfully "StyleName"
      it_should_output "<w:lsdException w:name=\"StyleName\" w:unhideWhenUsed=\"true\"/>", "StyleName"
    end

    with_value(1) do
      it_should_raise_an_exception
    end
  end

end
