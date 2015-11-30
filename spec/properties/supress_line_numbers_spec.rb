require "spec_helper"

describe OpenXml::Docx::Properties::SupressLineNumbers do
  include ValuePropertyTestMacros

  it_should_use tag: :supressLineNumbers, name: "supress_line_numbers"

  with_value(true) do
    it_should_work
    it_should_output "<w:supressLineNumbers/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
