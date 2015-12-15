require "spec_helper"

describe OpenXml::Docx::Properties::TableLayout do
  include PropertyTestMacros

  it_should_use tag: :tblLayout, name: "table_layout"

  for_attribute(:type) do
    with_value(:autofit) do
      it_should_assign_successfully
      it_should_output "<w:tblLayout w:type=\"autofit\"/>"
    end

    with_value(:fixed) do
      it_should_assign_successfully
      it_should_output "<w:tblLayout w:type=\"fixed\"/>"
    end

    with_value(:nope) do
      it_should_raise_an_exception
    end
  end

end
