require "spec_helper"

describe OpenXml::Docx::Properties::SupressAutoHyphens do
  include ValuePropertyTestMacros

  it_should_use tag: :supressAutoHyphens, name: "supress_auto_hyphens", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:supressAutoHyphens/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:supressAutoHyphens w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
