require "spec_helper"

describe OpenXml::Docx::Properties::KeepLines do
  include ValuePropertyTestMacros

  it_should_use tag: :keepLines, name: "keep_lines", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:keepLines/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:keepLines w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
