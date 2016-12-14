require "spec_helper"

describe OpenXml::Docx::Properties::EvenAndOddHeaders do
  include ValuePropertyTestMacros

  it_should_use tag: :evenAndOddHeaders, name: "even_and_odd_headers", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:evenAndOddHeaders/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:evenAndOddHeaders w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
