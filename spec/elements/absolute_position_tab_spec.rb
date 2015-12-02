require "spec_helper"

describe OpenXml::Docx::Elements::AbsolutePositionTab do
  include ElementTestMacros

  it_should_use tag: :ptab, name: "absolute_position_tab"

  with_no_attributes_set do
    it_should_output "<w:ptab/>", assign: false
  end

  for_attribute(:alignment, with_namespace: :w) do
    allowed = %i(center left right)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:leader, with_namespace: :w) do
    allowed = %i(dot hyphen middleDot none underscore)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:relativeTo, with_namespace: :w) do
    allowed = %i(indent margin)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  with_these_attributes_set(alignment: :center, relativeTo: :margin) do
    it_should_output "<w:ptab w:alignment=\"center\" w:relativeTo=\"margin\"/>", assign: false
  end

end
