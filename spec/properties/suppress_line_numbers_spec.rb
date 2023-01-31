require "spec_helper"

describe OpenXml::Docx::Properties::SuppressLineNumbers do
  include ValuePropertyTestMacros

  it_should_use tag: :suppressLineNumbers, name: "suppress_line_numbers", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:suppressLineNumbers/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:suppressLineNumbers w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
