require "spec_helper"

describe OpenXml::Docx::Properties::VerticalTextAlignment do
  include ValuePropertyTestMacros

  it_should_use tag: :vAlign, name: "vertical_text_alignment", value: :both

  with_value(:both) do
    it_should_work
    it_should_output "<w:vAlign w:val=\"both\"/>"
  end

  with_value(:bottom) do
    it_should_work
    it_should_output "<w:vAlign w:val=\"bottom\"/>"
  end

  with_value(:center) do
    it_should_work
    it_should_output "<w:vAlign w:val=\"center\"/>"
  end

  with_value(:top) do
    it_should_work
    it_should_output "<w:vAlign w:val=\"top\"/>"
  end

end
