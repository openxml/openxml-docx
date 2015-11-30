require "spec_helper"

describe OpenXml::Docx::Elements::AbsolutePositionTab do
  include ElementTestMacros

  it_should_use tag: :ptab, name: "absolute_position_tab"

  for_attribute(:alignment) do
    with_value(:center) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:alignment=\"center\"/>"
    end

    with_value(:left) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:alignment=\"left\"/>"
    end

    with_value(:right) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:alignment=\"right\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:leader) do
    with_value(:dot) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:leader=\"dot\"/>"
    end

    with_value(:hyphen) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:leader=\"hyphen\"/>"
    end

    with_value(:middleDot) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:leader=\"middleDot\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:leader=\"none\"/>"
    end

    with_value(:underscore) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:leader=\"underscore\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:relativeTo) do
    with_value(:indent) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:relativeTo=\"indent\"/>"
    end

    with_value(:margin) do
      it_should_assign_successfully
      it_should_output "<w:ptab w:relativeTo=\"margin\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<w:ptab/>", assign: false
  end

  with_these_attributes_set(alignment: :center, relativeTo: :margin) do
    it_should_output "<w:ptab w:alignment=\"center\" w:relativeTo=\"margin\"/>", assign: false
  end

end
