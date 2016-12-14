require "spec_helper"

describe OpenXml::Docx::Properties::PageBreakBefore do
  include ValuePropertyTestMacros

  it_should_use tag: :pageBreakBefore, name: "page_break_before", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:pageBreakBefore/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:pageBreakBefore w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
