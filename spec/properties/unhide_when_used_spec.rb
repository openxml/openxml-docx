require "spec_helper"

describe OpenXml::Docx::Properties::UnhideWhenUsed do
  include ValuePropertyTestMacros

  it_should_use tag: :unhideWhenUsed, name: "unhide_when_used"

  with_value(true) do
    it_should_work
    it_should_output "<w:unhideWhenUsed/>"
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
