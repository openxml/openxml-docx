require "spec_helper"

describe OpenXml::Docx::Elements::AbsolutePositionTab do
  include ElementTestMacros

  it_should_use tag: :ptab, name: "absolute_position_tab"

  with_no_attributes_set do
    it_should_output "<w:ptab/>", assign: false
  end

  for_attribute(:alignment) do
   %i(center left right).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<w:ptab w:alignment=\"#{allowed_value}\"/>"
      end
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:leader) do
    %i(dot hyphen middleDot none underscore).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<w:ptab w:leader=\"#{allowed_value}\"/>"
      end
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:relative_to) do
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

  with_these_attributes_set(alignment: :center, relative_to: :margin) do
    it_should_output "<w:ptab w:alignment=\"center\" w:relativeTo=\"margin\"/>", assign: false
  end

end
