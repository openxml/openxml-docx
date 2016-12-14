require "spec_helper"

describe OpenXml::Docx::Properties::CompressPunctuation do
  include ValuePropertyTestMacros

  it_should_use tag: :topLinePunct, name: "compress_punctuation", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:topLinePunct/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:topLinePunct w:val=\"false\"/>"
  end

  with_value(:on) do
    it_should_work
    it_should_output "<w:topLinePunct w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:topLinePunct w:val=\"off\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
