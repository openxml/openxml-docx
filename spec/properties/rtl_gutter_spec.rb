require "spec_helper"

describe OpenXml::Docx::Properties::RtlGutter do
  include ValuePropertyTestMacros

  it_should_use tag: :rtlGutter, name: "rtl_gutter"

  with_value(true) do
    it_should_work
    it_should_output "<w:rtlGutter w:val=\"true\"/>"
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
