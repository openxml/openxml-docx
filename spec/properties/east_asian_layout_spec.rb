require "spec_helper"

describe OpenXml::Docx::Properties::EastAsianLayout do
  include PropertyTestMacros

  it_should_use tag: :eastAsianLayout, name: "east_asian_layout"

  for_attribute(:combine) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combine=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combine=\"off\"/>"
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:combine_brackets) do
    with_value(:angle) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combineBrackets=\"angle\"/>"
    end

    with_value(:curly) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combineBrackets=\"curly\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combineBrackets=\"none\"/>"
    end

    with_value(:round) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combineBrackets=\"round\"/>"
    end

    with_value(:square) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:combineBrackets=\"square\"/>"
    end

    with_value(:smileyFaces) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:id=\"1\"/>"
    end

    with_value(-81238123) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:id=\"-81238123\"/>"
    end

    with_value(4.5) do
      it_should_raise_an_exception
    end

    with_value(:number1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:vert=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:vert=\"off\"/>"
    end

    with_value(:sorta) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_compress) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:vertCompress=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:eastAsianLayout w:vertCompress=\"off\"/>"
    end

    with_value(:sorta) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(id: 2, vertical: :on, vertical_compress: :on) do
    it_should_output "<w:eastAsianLayout w:id=\"2\" w:vert=\"on\" w:vertCompress=\"on\"/>", assign: false
  end

end
