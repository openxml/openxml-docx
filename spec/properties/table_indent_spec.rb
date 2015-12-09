require "spec_helper"

describe OpenXml::Docx::Properties::TableIndent do
  include PropertyTestMacros

  it_should_use tag: :tblInd, name: "table_indent"

  for_attribute(:type) do
    with_value(:dxa) do
      it_should_assign_successfully
      it_should_output "<w:tblInd w:type=\"dxa\"/>"
    end

    with_value(:pct) do
      it_should_assign_successfully
      it_should_output "<w:tblInd w:type=\"pct\"/>"
    end

    with_value(:pixels) do
      it_should_raise_an_exception
    end

    with_value(5) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    with_value(2) do
      it_should_assign_successfully
      it_should_output "<w:tblInd w:w=\"2\"/>"
    end

    with_value(12.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

end
