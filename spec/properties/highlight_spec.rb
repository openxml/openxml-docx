require "spec_helper"

describe OpenXml::Docx::Properties::Highlight do
  include ValuePropertyTestMacros

  it_should_use tag: :highlight, name: "highlight", value: :yellow

  with_value(:black) do
    it_should_work
    it_should_output "<w:highlight w:val=\"black\"/>"
  end

  with_value(:blue) do
    it_should_work
    it_should_output "<w:highlight w:val=\"blue\"/>"
  end

  with_value(:cyan) do
    it_should_work
    it_should_output "<w:highlight w:val=\"cyan\"/>"
  end

  with_value(:darkCyan) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkCyan\"/>"
  end

  with_value(:darkBlue) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkBlue\"/>"
  end

  with_value(:darkGray) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkGray\"/>"
  end

  with_value(:darkGreen) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkGreen\"/>"
  end

  with_value(:darkMagenta) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkMagenta\"/>"
  end

  with_value(:darkRed) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkRed\"/>"
  end

  with_value(:darkYellow) do
    it_should_work
    it_should_output "<w:highlight w:val=\"darkYellow\"/>"
  end

  with_value(:green) do
    it_should_work
    it_should_output "<w:highlight w:val=\"green\"/>"
  end

  with_value(:lightGray) do
    it_should_work
    it_should_output "<w:highlight w:val=\"lightGray\"/>"
  end

  with_value(:magenta) do
    it_should_work
    it_should_output "<w:highlight w:val=\"magenta\"/>"
  end

  with_value(:none) do
    it_should_work
    it_should_output "<w:highlight w:val=\"none\"/>"
  end

  with_value(:red) do
    it_should_work
    it_should_output "<w:highlight w:val=\"red\"/>"
  end

  with_value(:white) do
    it_should_work
    it_should_output "<w:highlight w:val=\"white\"/>"
  end

  with_value(:yellow) do
    it_should_work
    it_should_output "<w:highlight w:val=\"yellow\"/>"
  end

  with_value(:purple) do
    it_should_not_work
  end

end
