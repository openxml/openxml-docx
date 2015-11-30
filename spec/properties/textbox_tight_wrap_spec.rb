require "spec_helper"

describe OpenXml::Docx::Properties::TextboxTightWrap do
  include ValuePropertyTestMacros

  it_should_use tag: :textboxTightWrap, name: "textbox_tight_wrap", value: :none

  with_value(:allLines) do
    it_should_work
    it_should_output "<w:textboxTightWrap w:val=\"allLines\"/>"
  end

  with_value(:firstAndLastLine) do
    it_should_work
    it_should_output "<w:textboxTightWrap w:val=\"firstAndLastLine\"/>"
  end

  with_value(:firstLineOnly) do
    it_should_work
    it_should_output "<w:textboxTightWrap w:val=\"firstLineOnly\"/>"
  end

  with_value(:lastLineOnly) do
    it_should_work
    it_should_output "<w:textboxTightWrap w:val=\"lastLineOnly\"/>"
  end

  with_value(:none) do
    it_should_work
    it_should_output "<w:textboxTightWrap w:val=\"none\"/>"
  end

end
