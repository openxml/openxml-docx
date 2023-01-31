require "spec_helper"

describe OpenXml::Docx::Properties::SuppressAutoHyphens do
  include ValuePropertyTestMacros

  it_should_use tag: :suppressAutoHyphens, name: "suppress_auto_hyphens", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:suppressAutoHyphens/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:suppressAutoHyphens w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
